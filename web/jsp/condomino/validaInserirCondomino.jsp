<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="br.com.fatec.controler.CondominoControler"%>

<%
    String nome = request.getParameter("NOME");
    String email = request.getParameter("EMAIL");   
    Condomino cond = new Condomino(0,nome,email);
    CondominoControler condcont = new CondominoControler();
    cond = condcont.inserirCondomino(cond);

    // REDIRECIONA PARA A PAG LOGIN.JSP
    //String url = "inserirCondomino.jsp";
    //response.sendRedirect(url);
%>

