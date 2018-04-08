<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>INSERIR - CONDÔMINO</title>
    <body>
        <%@include file="../acesso/navbar.jsp" %>
        <div class="row">
            <div class="card col s12 m6 l4 offset-l4 offset-m3 grey lighten-4">
                <div class="row center">
                    <i class="large material-icons teal-text">person_add</i>
                    <h4>Adicionar Condômino</h4>
                    <form name="inserirCodomino" action="validaInserirCondomino.jsp" method="post">
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="novo_nome" type="text" name="NOME" value="">
                                <label for="novo_nome">Nome</label>
                            </div>       
                        </div>
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="novo_email" type="email" name="EMAIL" value="">
                                <label for="novo_email">Email</label>
                            </div>       
                        </div>
                        <div class="row" onclick="$('.progress').show();">
                            <div class="col s12 center">  
                                <a class="btn green" onclick="inserir()">
                                    Salvar
                                </a>
                                <!--<input type="submit" name="Enviar" value="Salvar" class="btn center green">-->
                            </div>    
                        </div>
                        <div class="progress" style="display: none">
                            <div class="indeterminate"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="fixed-action-btn">
            <a href="listarCondomino.jsp" class="btn-floating btn-large purple">
                <i class="large material-icons">list</i>
            </a>  
        </div>    
    </body>
</html>
<script>
    function inserir(){
        var nome = $('#novo_nome').val();
        var email = $('#novo_email').val();
        if(nome && email){
            $.post("validaInserirCondomino.jsp", {NOME: nome, EMAIL: email}, function(){            
                Materialize.toast('Inserindo...',1000);
                setInterval(function(){ location.reload(); }, 1000);
            });    
        }else{
            alert("Faiz Favô, preencha os dados corretamente!");
        }
        
    }    
</script>