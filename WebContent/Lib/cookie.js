// 여기서부터 function 까지는 익스플로러 9이하를 위해서 별도로 추가된 부분
// 익스플로러 버전 호환성 증가 시작

var JSON = JSON || {};

// implement JSON.stringify serialization
JSON.stringify = JSON.stringify || function (obj) {

var t = typeof (obj);
if (t != "object" || obj === null) {

    // simple data type
    if (t == "string") obj = '"'+obj+'"';
    return String(obj);

}
else {

    // recurse array or object
    var n, v, json = [], arr = (obj && obj.constructor == Array);

    for (n in obj) {
        v = obj[n]; t = typeof(v);

        if (t == "string") v = '"'+v+'"';
        else if (t == "object" && v !== null) v = JSON.stringify(v);

        json.push((arr ? "" : '"' + n + '":') + String(v));
    }

    return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
}
};

// implement JSON.parse de-serialization
JSON.parse = JSON.parse || function (str) {
if (str === "") str = '""';
eval("var p=" + str + ";");
return p;
 };
 // 익스플로러 버전 호환성 증가 종료

(function ($) {
    $.fn.extend({
        cookieList: function (cookieName) {
        
            return {
                add: function (val) {
                    var array    = this.items();

                    //현재  동일값 존재 여부 확인 후 없으면 넣는다.
//                    console.log("this.items().indexOf(val):"+this.indexOf(val));
//                    console.log("this.items().length():"+this.length());
                    //this.hasitem(val);
//                    console.log(typeof(this.hasitem(val)));
                    if(typeof(this.hasitem(val))== "undefined"){
                        array.push(val);
                        
                        var inStr = JSON.stringify(array);
                        $.cookie(cookieName, inStr, { expires:360, path: '/' });
                        
                        
                    }else{
//                        console.log(this.items().indexOf(val));
//                        console.log("index 존재:"+val);
                    }
            
                },
                update: function (val,index) {
						 var items = this.items();
						 items.splice(index, 1, val);

						 var inStr = JSON.stringify(items);
//						 alert(inStr);
						 $.cookie(cookieName, inStr, { expires: 360, path: '/' });  
                },				
                remove: function (val) {
                    var items = this.items();
                    
                    var index = items.indexOf(val);
                    
                    if (index != -1) {
                        items.splice(index, 1);
                        $.cookie(cookieName, items.join(','), { expires: 360, path: '/' });
                    }
                },
                removebyindex: function (index) {     
					 var items = this.items();

                    if (index != -1) {
                        items.splice(index, 1);
						var inStr = JSON.stringify(items);
                        $.cookie(cookieName, inStr, { expires: 360, path: '/' });
                    }
                },
                indexOf: function (val) {
                    return this.items().indexOf(val);
                },
                clear: function () {
                    $.cookie(cookieName, null, { expires: 360, path: '/' });
                },
                items: function () {
                    var cookie = $.cookie(cookieName);
                    return cookie ? JSON.parse(cookie):[];
                },
                hasitem: function (val){
                    for (var k in this.items()){
                        var entry1 = JSON.stringify(this.items()[k]);
                        var val1 = JSON.stringify(val);
                        if(val1 == entry1){
//                            console.log("key:"+k);
                            return k;
                        }
                    }
                },
                length: function () {
                    return this.items().length;
                }
            };
        }
    });
})(jQuery);