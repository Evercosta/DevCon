<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page import="br.com.fatec.controler.ApartamentoControler"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ApartamentoControler apcont = new ApartamentoControler();
    List<Apartamento> aps = apcont.listarTodosApartamento();
    //Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");  
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>    
    <title>TABELA - APARTAMENTO</title>
    <body>
        <%@include file="../acesso/navbar.jsp" %>
        <div class="container"/>
            <h4 class="center">LISTA DE APARTAMENTOS</h4>           
            <table class="striped responsive-table">
                <thead>
                    <tr>
                        <th data-field="Id" class="center">Id</th>
                        <th data-field="Bloco" class="center">Bloco</th>
                        <th data-field="Andar" class="center">Andar</th> 
                        <th data-field="Numero" class="center">Número</th>
                        <th class="center">Alterar</th>
                        <th class="center">Excluir</th>
                    </tr>
                 </thead>
                <% if (!(aps.isEmpty())) { %>    
                <tbody>
                    <% for (Apartamento listaApartamento : aps) { %>
                        <tr >
                            <td class="center"><%=listaApartamento.getIdAp()%></td>
                            <td class="center"><%=listaApartamento.getBloco()%></td>
                            <td class="center"><%=listaApartamento.getAndar()%></td> 
                            <td class="center"><%=listaApartamento.getNumero()%></td>
                            <td class="center">
                                <a style="cursor: pointer" 
                                   onclick="abrir_modal(<%=listaApartamento.getIdAp()%>,'<%=listaApartamento.getBloco()%>','<%=listaApartamento.getAndar()%>','<%=listaApartamento.getNumero()%>')">
                                    <i class="material-icons">edit</i>
                                </a>
                            </td>
                            <td class="center">
                                <a style="cursor: pointer" 
                                   onclick="excluir(<%=listaApartamento.getIdAp()%>)">
                                    <i class="material-icons red-text">delete</i>
                                </a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            <% } %>
            </table>
        </div>
    </body>
    <div class="fixed-action-btn">
        <a href="inserirApartamento.jsp" class="btn-floating btn-large green">
            <i class="large material-icons">add</i>
        </a>  
    </div>
    <div id="modal_edit" class="modal">
        <div class="modal-content">
            <h4 class="center">Alterar apartamento</h4>
            <form name="inserirApartamento" action="validaAlterarApartamento.jsp" method="post">                
                <div class="row">
                    <input id="edit_id" type="hidden" value="" name="ID">
                    <div class="input-field col s12">
                        <input id="edit_bloco" type="text" name="BLOCO" value="">
                        <label for="edit_bloco">Bloco</label>
                    </div>
                </div>
                <div class="row">
                    <input id="edit_id" type="hidden" value="" name="ID">
                    <div class="input-field col s12">
                        <input id="edit_andar" type="text" name="ANDAR" value="">
                        <label for="edit_andar">Andar</label>
                    </div>
                </div>
                <div class="row">
                    <input id="edit_id" type="hidden" value="" name="ID">
                    <div class="input-field col s12">
                        <input id="edit_numero" type="number" name="NUMERO" value="">
                        <label for="edit_numero">Número</label>
                    </div>
                </div>
                <div class="row">                    
                    <div class="col s12 center">
                        <a class="btn green" onclick="alterar()">
                            Salvar
                        </a>                       
                    </div>
                </div>                           
            </form>
        </div>       
    </div>
    
</html>
<script>
    function abrir_modal(id,bloco,andar,numero){
        var edit_id = document.getElementById('edit_id');
        var edit_bloco = document.getElementById('edit_bloco');
        var edit_andar = document.getElementById('edit_andar');
        var edit_numero = document.getElementById('edit_numero');
        edit_id.value = id;
        edit_bloco.value = bloco;
        edit_andar.value = andar;
        edit_numero.value = numero;
        $('label').addClass('active');
        $('#modal_edit').openModal();        
    }
    function alterar(){
        var id = $("#edit_id").val();
        var bloco = $("#edit_bloco").val();
        var andar = $("#edit_andar").val();
        var numero = $("#edit_numero").val();
        if(bloco && andar){
            $.post("validaAlterarApartamento.jsp", {ID: id, BLOCO: bloco, ANDAR: andar, NUMERO: numero}, function(){            
                Materialize.toast('Alterando...',1000);
                setInterval(function(){ location.reload(); }, 1000);
            });    
        }else{
            alert("Faiz Favô, preencha os dados corretamente!");
        }        
    }
    function excluir(id){        
        $.post("excluirApartamento.jsp", {ID: id}, function(){            
            Materialize.toast('Excluindo...',1000);
            setInterval(function(){ location.reload(); }, 1000);
        });
    }
</script>