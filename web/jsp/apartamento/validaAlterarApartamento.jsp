<%@page import="br.com.fatec.controler.ApartamentoControler"%>
<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String bloco = request.getParameter("BLOCO");
    String andar = request.getParameter("ANDAR");
    int numero = Integer.parseInt(request.getParameter("NUMERO"));

    Apartamento ap = new Apartamento(id,bloco,andar,numero);
    ApartamentoControler apCont = new ApartamentoControler();
    ap = apCont.alterarApartamento(ap);
    //response.sendRedirect("listarApartamento.jsp");
%>