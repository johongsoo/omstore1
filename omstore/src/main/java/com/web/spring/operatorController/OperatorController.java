package com.web.spring.operatorController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OperatorController {
	
	
	//http://localhost:8080/ProductsList
	@RequestMapping("ProductsList")
	public String ProductsList() {
		return "WEB-INF\\Operator\\productslist.jsp";
	}
	
	//http://localhost:8080/operator
	@RequestMapping("operator")
	public String operator() {
		return "WEB-INF\\Operator\\oprator.jsp";
	}
	
}
