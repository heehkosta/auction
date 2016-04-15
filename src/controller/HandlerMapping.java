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
		}else if(command.equals("userIDcheck")){
			controller = new IdcheckController();
		}else if(command.equals("login")){
			controller = new LoginController();
		}    
		return controller;
	}
}
