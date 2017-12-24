package com.bit_fr.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class MemberFilter
 */
@WebFilter({"/listQna.do", "/cartList.do", "/myPage.do", "/sellWrite.do", "/insertOrderlist.do", "/paymentInfo.do"})
public class MemberFilter implements Filter {
	/**
	 * Default constructor.
	 */
	public MemberFilter() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String id = "";
		if (((HttpServletRequest) request).getSession().getAttribute("id") != null) {
			id = (String) ((HttpServletRequest) request).getSession().getAttribute("id");
		}
		if (id!=null && !id.equals("") ) {
			chain.doFilter(request, response);
		} else {
			((HttpServletResponse) response).sendRedirect("gotomember.do");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}
}