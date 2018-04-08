<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>INSERIR - APARTAMENTO</title>
    <body>
        <%@include file="../acesso/navbar.jsp" %>
        <div class="row">
            <div class="card col s12 m6 l4 offset-l4 offset-m3 grey lighten-4">
                <div class="row center">
                    <i class="large material-icons teal-text">business</i>
                    <h4>Adicionar Apartamento</h4>
                    <form name="inserirApartamento" action="validaInserirApartamento.jsp" method="post">
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="novo_bloco" type="text" name="BLOCO" value="">
                                <label for="novo_bloco">Bloco</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="novo_andar" type="text" name="ANDAR" value="">
                                <label for="novo_andar">Andar</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="novo_numero" type="number" name="NUMERO" value="">
                                <label for="novo_numero">Número</label>
                            </div>
                        </div>
                        <div class="row" onclick="$('.progress').show();">
                            <div class="col s12 center">  
                                <a class="btn green" onclick="inserir()">
                                    Salvar
                                </a>                                
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
            <a href="listarApartamento.jsp" class="btn-floating btn-large purple">
                <i class="large material-icons">list</i>
            </a>  
        </div> 
    </body>
</html>
<script>
    function inserir(){
        var bloco = $('#novo_bloco').val();
        var andar = $('#novo_andar').val();
        var numero = $('#novo_numero').val();
        if(bloco && andar){
            $.post("validaInserirApartamento.jsp", {BLOCO: bloco, ANDAR: andar, NUMERO: numero}, function(){            
                Materialize.toast('Inserindo...',1000);
                setInterval(function(){ location.reload(); }, 1000);
            });    
        }else{
            alert("Faiz Favô, preencha os dados corretamente!");
        }        
    }    
</script>