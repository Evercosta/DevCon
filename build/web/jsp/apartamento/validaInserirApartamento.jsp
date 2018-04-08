<%@page import="br.com.fatec.controler.ApartamentoControler"%>
<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String bloco = request.getParameter("BLOCO");
    String andar = request.getParameter("ANDAR");   
    int numero = Integer.parseInt(request.getParameter("NUMERO"));
    Apartamento ap = new Apartamento(0,bloco,andar,numero);
    ApartamentoControler apcont = new ApartamentoControler();
    ap = apcont.inserirApartamento(ap);
    
    //String url = "inserirApartamento.jsp";
    //response.sendRedirect(url);
%>

