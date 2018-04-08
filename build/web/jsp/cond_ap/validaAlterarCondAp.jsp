<%@page import="br.com.fatec.controler.CondApControler"%>
<%@page import="br.com.fatec.bean.CondAp"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    int id_cond = Integer.parseInt(request.getParameter("IDCOND"));
    int id_ap = Integer.parseInt(request.getParameter("IDAP"));
    Condomino cond = new Condomino(id_cond,"","");
    Apartamento ap = new Apartamento(id_ap,"","",0);
    CondAp cp = new CondAp(id,cond,ap);
    CondApControler cpCont = new CondApControler();
    cp = cpCont.alterarCondAp(cp);
    response.sendRedirect("listarCondAp.jsp");
%>