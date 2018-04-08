<%@page import="br.com.fatec.controler.ApartamentoControler"%>
<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Apartamento ap = new Apartamento(id,"","",0);
    ApartamentoControler apCont = new ApartamentoControler();
    ap = apCont.excluirApartamento(ap);   
    //response.sendRedirect("listarCondomino.jsp");
%>
