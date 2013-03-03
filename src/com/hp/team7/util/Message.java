/**
 * 
 */
package com.hp.team7.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

/**
 * @author k95
 *
 */
public class Message {
	
	/**
	 * 弹出提示信息
	 * 用法
	 * PrintWriter out = Message.displayMessage();
				out.print("<script>alert('错误！')</script>");  
                out.print("<script>window.location.href='login.jsp'</script>");  
                out.flush();  
                out.close();
				return null;
	 * @return
	 */
	public static PrintWriter displayMessage(){
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setContentType("text/html;charset=UTF-8");   
		response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码   
		PrintWriter out = null;  
		try {  
			out = response.getWriter();  
		} catch (IOException e) {  
			e.printStackTrace();  
		}
		return out;
	}
}	
