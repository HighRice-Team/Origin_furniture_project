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
 * Servlet Filter implementation class ManagerFilter
 */
@WebFilter({"/insertReply.do", "/productList.do"})
public class ManagerFilter implements Filter {
	/**
	 * Default constructor.
	 */
	public ManagerFilter() {
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
		if (((HttpServletRequest) request).getSession().getAttribute("mid") != null) {
			id = (String) ((HttpServletRequest) request).getSession().getAttribute("mid");
		}
		if (id!=null && !id.equals("") ) {
			chain.doFilter(request, response);
		} else {
			((HttpServletResponse) response).sendRedirect("gotomanager.do");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}
}