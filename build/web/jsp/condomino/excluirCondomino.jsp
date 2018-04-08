<%@page import="br.com.fatec.controler.CondominoControler"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Condomino cond = new Condomino(id,"","");
    CondominoControler condCont = new CondominoControler();
    cond = condCont.excluirCondomino(cond);   
    //response.sendRedirect("listarCondomino.jsp");
%>
