package model;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CartDAO {
	private static CartDAO cd = new CartDAO();

	private CartDAO(){

	}

	public static CartDAO getInstance(){
		return cd;
	}

	////장바구니 정보를 확인하는 로직////
	public ArrayList<ItemVO> getCartList(HttpServletRequest request){
		ArrayList<ItemVO> cartList = new ArrayList<ItemVO>();
		HttpSession session = request.getSession();
		cartList = (ArrayList<ItemVO>) session.getAttribute("cartlist");
		System.out.println("DAO CARTLIST"+cartList);
		return cartList;
	}

	////장바구니에 품목을 추가하는 로직////
	public void addCart(HttpServletRequest request,ItemVO vo) throws SQLException{
		HttpSession session = request.getSession();
		ArrayList<ItemVO> cartList = (ArrayList<ItemVO>) session.getAttribute("cartlist");
		if(cartList==null){
			cartList = new ArrayList<ItemVO>();
			cartList.add(vo);
		}
		for(int i = 0; i < cartList.size(); i++){
			if(vo.getItemID()==cartList.get(i).getItemID()){
				System.out.println(vo.getItemID()+" 은 이미 등록된 상품입니다.");
				break;
			}else{
				cartList.add(vo);
			}
		}
		session.setAttribute("cartlist", cartList);
	}

	////장바구니에 특정 품목을 삭제하는 로직////
	public void deleteItemCart(HttpServletRequest request,String[] itemID){
		ArrayList<ItemVO> cartList = new ArrayList<ItemVO>();
		HttpSession session = request.getSession();
		cartList = (ArrayList<ItemVO>) session.getAttribute("cartlist");
		for(int i = 0; i < itemID.length; i++){
			for(int j = 0; j < cartList.size();j++){
				if(itemID[i].equals(cartList.get(j).getItemID())){
					cartList.remove(i);
					break;
				}
			}
		}	
	}
	
	////장바구니에 모든 품목을 삭제하는 로직////
	public void deleteAllCart(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
	}
}










