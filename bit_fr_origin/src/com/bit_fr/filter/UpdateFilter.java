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


@WebFilter({ "/updateQna.do", "/deleteQna.do" })
public class UpdateFilter implements Filter {

	public UpdateFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		String member_id = "";
		String detailMember = "";

		if (((HttpServletRequest) request).getSession().getAttribute("id") != null
				&& ((HttpServletRequest) request).getParameter("detailMember") != null) {
			member_id = ((HttpServletRequest) request).getSession().getAttribute("id").toString();
			detailMember = ((HttpServletRequest) request).getParameter("detailMember").toString();
		}

		if (member_id != null && !member_id.equals("") && member_id.equals(detailMember)) {
			chain.doFilter(request, response);
		} else {
			((HttpServletResponse) response).sendRedirect("gotomember.do");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}