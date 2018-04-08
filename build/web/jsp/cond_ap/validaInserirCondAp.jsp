<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="br.com.fatec.controler.CondApControler"%>
<%@page import="br.com.fatec.bean.CondAp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int idCond = Integer.parseInt(request.getParameter("IDCOND"));
    int idAp = Integer.parseInt(request.getParameter("IDAP"));
    Condomino cond =  new Condomino(idCond,"","");
    Apartamento ap = new Apartamento(idAp,"","",0);
    CondAp condap = new CondAp(0,cond,ap);
    CondApControler apcont = new CondApControler();
    condap = apcont.inserirCondAp(condap);
    
    //String url = "inserirCondAp.jsp";
    //response.sendRedirect(url);
%>

