package pagingservice;

import java.util.ArrayList;

import model.ItemVO;


public class ListVO {
	private PagingBean pb;
	private ArrayList<ItemVO> list;
	
	public ListVO(PagingBean pb, ArrayList<ItemVO> list) {
		super();
		this.pb = pb;
		this.list = list;
	}

	public ListVO() {
		super();
	}

	public PagingBean getPb() {
		return pb;
	}

	public void setPb(PagingBean pb) {
		this.pb = pb;
	}

	public ArrayList<ItemVO> getList() {
		return list;
	}

	public void setList(ArrayList<ItemVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ListVO [pb=" + pb + ", list=" + list + "]";
	}
	
	

}
