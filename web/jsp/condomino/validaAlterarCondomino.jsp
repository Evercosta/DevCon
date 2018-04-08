<%@page import="br.com.fatec.controler.CondominoControler"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String nome = request.getParameter("NOME");
    String email = request.getParameter("EMAIL");  

    Condomino cond = new Condomino(id,nome,email);
    CondominoControler condCont = new CondominoControler();
    cond = condCont.alterarCondomino(cond);
    //response.sendRedirect("listarCondomino.jsp");
%>