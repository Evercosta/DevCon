<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="br.com.fatec.controler.CondApControler"%>
<%@page import="br.com.fatec.bean.CondAp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Condomino cond = new Condomino(0,"","");
    Apartamento ap = new Apartamento(0,"","",0);
    CondAp cp = new CondAp(id,cond,ap);
    CondApControler cpCont = new CondApControler();
    cp = cpCont.excluirCondAp(cp);   
    //response.sendRedirect("listarCondomino.jsp");
%>
