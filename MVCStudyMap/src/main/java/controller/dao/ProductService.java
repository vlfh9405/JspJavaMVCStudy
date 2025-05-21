package controller.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import controller.dto.Product;

public class ProductService {
	Map<String, Product> products = new HashMap<String, Product>();
	
	public ProductService() { //생성자, db없이 실행하기 위해 생성자 추가
		Product p = new Product("101", "ApplePhone", "애플전자", 1204000, "2025.05.16");
		products.put("101",p);
		
		p = new Product("102", "SamsungPhone", "삼성전자", 1020000, "2025.05.15");
		products.put("102",p);
		
		
		p = new Product("103", "LGPhone", "엘쥐전자", 901000, "2025.05.02");
		products.put("103",p);
	}
	
	public List<Product> findAll(){
		return new ArrayList<Product>(products.values());
	}
	
	public Product find(String id) {
		return products.get(id);      
	}
	
	public List<Product> delete(String id){
		products.remove(id);
		return new ArrayList<Product>(products.values());
	}
}


