/*##################################################
*	Rolling v2.0
*
*	@author		HanSeungho landboy@gmail.com
*	@copyright	Copyright (c) HanSeungho
*
*	작성일 :			2008-08-01
*	최종수정일 :	2009-06-20
##################################################*/

function rolling(parent, id, method, width, height, cols, rows, moveunit) {
	this.isIE = (navigator.userAgent.toLowerCase().indexOf("msie") != -1);

	this.timer = null;
	this.objWrap = null;
	this.arrData = new Array();							// 롤링 항목 배열

	this.parent = parent;
	this.id = id;													// 롤링 객체ID
	this.method = method;								// 롤링 방법(v : 상하, h : 좌우)
	this.width = width;										// 항목 폭(px)
	this.height = height;									// 항목 높이(px)
	this.cols = (cols)?cols:1;								// 노출 가로 개수
	this.rows = (rows)?rows:1;							// 노출 세로 개수
	this.moveunit = (moveunit)?moveunit:0;		// 이동단위(0 : 롤링항목별, 1 : 롤링그룹별)

	this.direction = 1;											// 방향(1 : 정방향, -1 : 역방향)
	this.idle = 3000;											// 정지 타이머
	this.time = 3;												// 실행 타이머 : 작을수록 부드러움
	this.speed = 7;											// 움직임 속도 : 작을수록 빠름
	this.align = 'left';											// 항목 수평 정렬(left 고정)
	this.valign = 'top';										// 항목 수직 정렬(top 고정)
	this.overstop = true;									// 마우스 오버시 정지 여부

	this.direct_time = 1;										// 즉시이동 실행 타이머(작을수록 부드러움)
	this.direct_speed = 3;									// 즉시이동 움직임 속도(작을수록 빠름)

	this.cells = 0;												// 노출 항목 개수
	this.target = 0;											// 이동 목적지 위치값
	this.basis = 0;												// 기준 사이즈값(상하 롤링 경우 : 항목 높이, 좌우 롤링 경우 : 항목 폭)
	this.end = 0;
	this.isdirect = false;

	this.add = function(data) {
		this.arrData[this.arrData.length] = data;
	}

	this.init = function() {
		var self = this;
		var objTable = objTbody = objTr = objTd = objDiv = null;
		var i, len, no;
		var html = '';

		if (this.direction != 1 && this.direction != -1) this.direction = 1;
		if (this.moveunit != 1) this.moveunit = 0;

		this.cells = this.cols * this.rows;
		this.basis = ((this.method == 'h')?this.width:this.height);
		if (this.moveunit) {
			this.basis *= ((this.method=='h')?this.cols:this.rows);
			this.end = this.basis * Math.ceil(this.arrData.length / (this.cols * this.rows));
		}
		else {
			this.end = this.basis * Math.ceil(this.arrData.length / ((this.method=='h')?this.rows:this.cols));
		}

		var wrapWidth = this.width * this.cols;
		var wrapHeight = this.height * this.rows;

		this.objWrap = document.createElement('div');
		this.objWrap.id = this.id;
		this.objWrap.style.width = wrapWidth+'px';
		this.objWrap.style.height = wrapHeight+'px';
		this.objWrap.style.overflow = 'hidden';
		this.objWrap.style.display = 'none';
		if (this.overstop) {
			this.objWrap.onmouseover = function() { self.pause(); }
			this.objWrap.onmouseout = function() {
				if (self.cells < self.arrData.length) {
					if (((self.method=='h') ? self.objWrap.scrollLeft : self.objWrap.scrollTop) % self.basis > 0) self.play();
					else self.timer = setTimeout(function() { self.play() }, self.idle);
				}
			}
		}

		objTable = this.objWrap.appendChild(document.createElement('table'));
		objTable.cellPadding = 0;
		objTable.cellSpacing = 0;
		objTable.border = 0;
		objTable.style.tableLayout = 'fixed';

		objTbody = objTable.appendChild(document.createElement('tbody'));

		if (this.method == 'h') objTr = objTbody.appendChild(document.createElement('tr'));

		for (s=0; s<2; s++) {
			if (s == 0) len = this.arrData.length;
			else {
				if (this.cells >= this.arrData.length) break;
				len = this.cells;
			}

			for (i=0; i<len; i++) {
				no = i + 1;

				if (this.method == 'v') {
					html += '<div style="float:left; width:'+this.width+'px; height:'+this.height+'px; overflow:hidden;">'+this.arrData[i]+'</div>';

					if (this.moveunit) {
						if (no % this.cols == 0 || i == (len-1)) {
							if (!objTd) {
								objTr = objTbody.appendChild(document.createElement('tr'));
								objTd = objTr.appendChild(document.createElement('td'));
								objTd.noWrap = true;
								objTd.width = (this.width * this.cols);
								objTd.height = (this.height * this.rows);
								objTd.align = this.align;
								objTd.vAlign = this.valign;
							}
							objDiv = objTd.appendChild(document.createElement('div'));
							objDiv.style.clear = 'both';
							objDiv.innerHTML = html;
							html = '';

							if (no % (this.cols * this.rows) == 0) objTd = null;
						}
					}
					else {
						if (no % this.cols == 0 || i == (len-1)) {
							objTr = objTbody.appendChild(document.createElement('tr'));
							objTd = objTr.appendChild(document.createElement('td'));
							objTd.noWrap = true;
							objTd.width = (this.width * this.cols);
							objTd.height = this.height;
							objTd.align = this.align;
							objTd.vAlign = this.valign;
							objTd.innerHTML = html;
							html = '';
						}
					}
				}
				else {
					html += '<div style="width:'+this.width+'px; height:'+this.height+'px; overflow:hidden;">'+this.arrData[i]+'</div>';

					if (this.moveunit) {
						if (no % this.rows == 0 || i == (len-1)) {
							if (!objTd) {
								objTd = objTr.appendChild(document.createElement('td'));
								objTd.noWrap = true;
								objTd.width = (this.width * this.cols);
								objTd.height = (this.height * this.rows);
								objTd.align = this.align;
								objTd.vAlign = this.valign;
							}
							objDiv = objTd.appendChild(document.createElement('div'));
							if (this.isIE)	objDiv.style.styleFloat = 'left';
							else				objDiv.style.cssFloat = 'left';
							objDiv.innerHTML = html;
							html = '';

							if (no % (this.cols * this.rows) == 0) objTd = null;
						}
					}
					else {
						if (no % this.rows == 0 || i == (len-1)) {
							objTd = objTr.appendChild(document.createElement('td'));
							objTd.noWrap = true;
							objTd.width = this.width;
							objTd.height = (this.height * this.rows);
							objTd.align = this.align;
							objTd.vAlign = this.valign;
							objTd.innerHTML = html;
							html = '';
						}
					}
				}
			}

			objTd = null;
		}
	}

	this.run = function() {
		var self = this;
		window.clearTimeout(this.timer);

		if (this.arrData.length > 0 && this.objWrap) {
			this.parent.appendChild(this.objWrap);
			this.objWrap.style.display = '';
		}
		if (this.cells < this.arrData.length) {
//			this.target = this.basis * this.direction;  원래 함수인데 최초초기값이 이미지 1개값을 가져오고 잇음.
			this.target = 0; // 따라서 강제로 0으로 고정
			this.timer = setTimeout(function() { self.play() }, this.idle);
		}
	}

	this.play = function() {
		var self = this;
		window.clearTimeout(this.timer);

		if (!this.idle) this.idle = 1;
		if (!this.time) this.time = 1;
		if (!this.speed) this.speed = 1;

		var scroll = (this.method=='h') ? this.objWrap.scrollLeft : this.objWrap.scrollTop;
		if (scroll == this.target) this.target = scroll + (this.basis * this.direction);
		if (this.target < 0) { scroll = this.end; this.target = scroll - this.basis; }
		else if (this.target > this.end) { scroll = 0; this.target = this.basis; }
		var dist = Math.ceil((this.target - scroll) / ((this.isdirect)?this.direct_speed:this.speed));
		var next = scroll + ((dist)?dist:this.direction);

		if (this.method=='h') this.objWrap.scrollLeft = next;
		else this.objWrap.scrollTop = next;

		if (next % this.basis > 0) { this.timer = setTimeout(function() { self.play() }, ((this.isdirect)?this.direct_time:this.time)); }
		else { this.isdirect = false; this.timer = setTimeout(function() { self.play() }, this.idle); }
	}

	this.pause = function() {
		window.clearTimeout(this.timer);
	}

	this.direct = function(direction) {
		if (typeof document.getElementById(this.id) != 'undefined' && this.cells < this.arrData.length) {
			window.clearTimeout(this.timer);

			if (!this.direct_time) this.direct_time = 1;
			if (!this.direct_speed) this.direct_speed = 1;

			this.direction = direction;
			this.target = this.target + (this.basis * this.direction);
			this.isdirect = true;
			this.play();
		}
	}

	this.direct_right = function() {
		this.direct(1);
	}

	this.direct_reverse = function() {
		this.direct(-1);
	}
}
