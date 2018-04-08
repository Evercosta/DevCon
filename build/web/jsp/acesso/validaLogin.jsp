<%@page import="br.com.fatec.controler.UsuarioControler"%>
<%@page import="br.com.fatec.bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String login = request.getParameter("LOGIN");
    String senha = request.getParameter("SENHA");
    Usuario usu = new Usuario(0,"",login,senha,"","");
    UsuarioControler usucont = new UsuarioControler();
    usu = usucont.validaUsuario(usu);
    if(usu.getId()>0){
        session.setAttribute("UsuarioLogado",usu);
        response.sendRedirect("menu.jsp");
    }    
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ERRO - LOGIN/SENHA</title>
    <body>
        <div class="container">
            <div class="row">
                <div class="card col m6 l4 s12 offset-l4 offset-m3 grey lighten-4" style="padding: 1%">
                    <div class="row center">
                        <i class="large material-icons red-text">warning</i>
                        <h4>ERRO NO LOGIN/SENHA</h4>
                    </div>
                    <div class="row center">
                        <a href="login.jsp" class="btn cian">Voltar</a>
                    </div>
                </div>
            </div>
        </div>
       
          
    </body>
</html>