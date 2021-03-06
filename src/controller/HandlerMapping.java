package controller;



public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();
	private HandlerMapping(){
		
	}
	public static HandlerMapping getInstance(){
		return hm;
	}
	
	public Controller createController(String command){
		Controller controller = null;
		if(command.equals("sell")){
			controller = new SellController();
		}else if(command.equals("search")){
			controller = new SearchController();
		}else if(command.equals("buy")){
			controller = new BuyController();
		}else if(command.equals("describe")){
			controller = new DescribeController();
		}else if(command.equals("register")){
			controller = new RegisterController();
		}else if(command.equals("login")){
			controller = new LoginController();
		}else if(command.equals("logout")){
			controller = new LogoutController();
		}else if(command.equals("update")){
			controller = new UpdateController();
		}else if(command.equals("userIDcheck")){
			controller = new IdcheckController();
		}else if(command.equals("login")){
			controller = new LoginController();
		}else if(command.equals("pay")){
			controller = new PayController();    
		}else if(command.equals("cartlist")){
			controller = new CartListController();
		}else if(command.equals("addcart")){
			controller = new AddCartController();
		}else if(command.equals("deletecart")){
			controller = new DeleteCartController();
		}else if(command.equals("deleteallcart")){
			controller = new DeleteAllCartController();
		}else if(command.equals("additem")){
			controller = new AddItemController();
		}else if(command.equals("upload")){
			controller = new UploadController();
		}else if(command.equals("category")){
			controller = new CategoryController();
		}else if(command.equals("keyword")){
			controller = new KeywordController();
		}else if(command.equals("feedback")){
			controller = new FeedBackController();
		}else if(command.equals("addreview")){
			controller = new AddReviewController();
		}
		return controller;
	}
}
