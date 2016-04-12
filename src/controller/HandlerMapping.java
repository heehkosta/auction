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
		}
		return controller;
	}
}
