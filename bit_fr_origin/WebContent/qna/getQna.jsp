<%@page import="com.bit_fr.vo.QnaVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit_fr.dao.QnaDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	request.setCharacterEncoding("UTF-8");
	QnaDao dao = QnaDao.getInstance();
	String str = "<rows>";
	str += "<page>1</page>";
	str += "<total>20</total>";
	str += "<records>"+dao.getTotalPage()+"</records>";
	
	ArrayList<QnaVo> list = dao.listQna();
	
	for(QnaVo v : list){
		str+="<row>";
		str+="<cell>"+v.getBoard_id()+"</cell>";
		str+="<cell>";
		for(int i = 0; i<v.getB_level(); i++)
		{
			str+= "→ ";
		}
		str+= v.getTitle()+"</cell>";
		
		str+="<cell>"+v.getMember_id()+"</cell>";
		str+="<cell>"+v.getRegdate()+"</cell>";
		str+="</row>";
	}
	
	str += "</rows>";
	out.print(str);
%>