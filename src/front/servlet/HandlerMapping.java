package front.servlet;

import controller.Controller;


public class HandlerMapping {
	private static HandlerMapping hm = new HandlerMapping();
	private HandlerMapping(){
		
	}
	public static HandlerMapping getInstance(){
		return hm;
	}
	
	public Controller createController(String command){
		Controller controller = null;
		if(command.equals("")){
			
		}else if(command.equals("")){
			
		}
		return controller;
	}
}
