<%@page import="br.com.fatec.bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
    try{
        Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
        if(usuLogado.getId()<=0){
            response.sendRedirect("login.jsp");
        }         
    }catch (NullPointerException e) {
        response.sendRedirect("login.jsp");
    }       
%>