package com.charvikent.issuetracking.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

//@Component
//@Order(1)
public class MyFilter implements Filter {

  /**
   */

	//private String pathToBeIgnored;
  @Override
  public void init(final FilterConfig filterConfig) throws ServletException {
	  
	 // pathToBeIgnored = filterConfig.getInitParameter(" http://localhost:8080/assets/");
  }

  @Override
  public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws IOException, ServletException {
	  System.out.println("do filter invoked");
	  
	  HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	  
	  System.out.println("URL = " + req.getRequestURL());
	  
	  String path=req.getRequestURL().toString();
	  
		  chain.doFilter(request, response);
  }

  @Override
  public void destroy() {
  }
}
