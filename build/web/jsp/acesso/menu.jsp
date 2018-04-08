<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatec.bean.Usuario"%>
<%@page import="br.com.fatec.controler.UsuarioControler"%>
<%@include file="checkLogin.jsp" %>
<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>SISTEMA </title>
    <body class="grey lighten-4">        
        <%@include file="navbar.jsp" %>        
        <div class="row">
            <div class="col s12 m6 l4">
                <div class="card green lighten-4">
                    <div class="card-content">
                        <h4 class="center green-text">Condômino</h4>
                        <div class="row">                            
                                <a href="../condomino/inserirCondomino.jsp" class="btn green col s6 offset-s3">INSERIR</a>                            
                        </div>
                        <div class="row">                            
                                <a href="../condomino/listarCondomino.jsp" class="btn green col s6 offset-s3">LISTAR</a>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l4">
                <div class="card blue lighten-4">
                    <div class="card-content">
                        <h4 class="center blue-text">Apartamento</h4>
                        <div class="row">                            
                                <a href="../apartamento/inserirApartamento.jsp" class="btn blue col s6 offset-s3">INSERIR</a>                            
                        </div>
                        <div class="row">                            
                                <a href="../apartamento/listarApartamento.jsp" class="btn blue col s6 offset-s3">LISTAR</a>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l4">
                <div class="card purple lighten-4">
                    <div class="card-content">
                        <h4 class="center purple-text">Cond. x Ap.</h4>
                        <div class="row">                            
                                <a href="../cond_ap/inserirCondAp.jsp" class="btn purple col s6 offset-s3">INSERIR</a>                            
                        </div>
                        <div class="row">                            
                                <a href="../cond_ap/listarCondAp.jsp" class="btn purple col s6 offset-s3">LISTAR</a>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    $(document).ready(function(){
        $('.sidenav').sidenav();
    });
</script>