<%@page import="br.com.fatec.controler.CondominoControler"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CondominoControler condcont = new CondominoControler();
    List<Condomino> conds = condcont.listarTodosCondomino();
    //Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");  
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../acesso/navbar.jsp" %>
    <title>TABELA - CONDÔMINO</title>
    <body>
        <div class="container"/>
            <h4 class="center">LISTA DE CONDÔMINOS</h4>           
            <table class="striped responsive-table">
                <thead>
                    <tr>
                        <th data-field="Id" class="center">Id</th>
                        <th data-field="Nome" class="center">Nome</th>
                        <th data-field="Email" class="center">Email</th>                  
                        <th class="center">Alterar</th>
                        <th class="center">Excluir</th>
                    </tr>
                 </thead>
                <% if (!(conds.isEmpty())) { %>    
                <tbody>
                    <% for (Condomino listaCondomino : conds) { %>
                        <tr >
                            <td class="center"><%=listaCondomino.getRegCondomino()%></td>
                            <td class="center"><%=listaCondomino.getNome()%></td>
                            <td class="center"><%=listaCondomino.getEmail()%></td>                            
                            <td class="center">
                                <a style="cursor: pointer" 
                                   onclick="abrir_modal(<%=listaCondomino.getRegCondomino()%>,'<%=listaCondomino.getNome()%>','<%=listaCondomino.getEmail()%>')">
                                    <i class="material-icons">edit</i>
                                </a>
                            </td>
                            <td class="center">
                                <a style="cursor: pointer" 
                                   onclick="excluir(<%=listaCondomino.getRegCondomino()%>)">
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
        <a href="inserirCondomino.jsp" class="btn-floating btn-large green">
            <i class="large material-icons">add</i>
        </a>  
    </div>
    <div id="modal_edit" class="modal" style="width: 30%">
        <div class="modal-content">
            <h4 class="center">Alterar condômino</h4>
            <form name="inserirCodomino" action="validaAlterarCondomino.jsp" method="post">
                <div class="row">
                    <input id="edit_id" type="hidden" value="" name="ID">
                    <div class="input-field col s12">
                        <input id="edit_nome" type="text" name="NOME">
                        <label for="edit_nome">Nome</label>
                    </div>
                </div>
                <div class="row">                    
                    <div class="input-field col s12">
                        <input id="edit_email" type="email" name="EMAIL">
                        <label for="edit_email">Email</label>
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
    function abrir_modal(id,nome,email){
        var edit_id = document.getElementById('edit_id');
        var edit_nome = document.getElementById('edit_nome');
        var edit_email = document.getElementById('edit_email');
        edit_id.value = id;
        edit_nome.value = nome;
        edit_email.value = email;
        $('label').addClass('active');
        $('#modal_edit').openModal();        
    }
    function alterar(){
        var id = $("#edit_id").val();
        var nome = $("#edit_nome").val();
        var email = $("#edit_email").val();
        if(nome && email){
            $.post("validaAlterarCondomino.jsp", {ID: id, NOME: nome, EMAIL: email}, function(){            
                Materialize.toast('Alterando...',1000);
                setInterval(function(){ location.reload(); }, 1000);
            });    
        }else{
            alert("Faiz Favô, preencha os dados corretamente!");
        }        
    }
    function excluir(id){        
        $.post("excluirCondomino.jsp", {ID: id}, function(){            
            Materialize.toast('Excluindo...',1000);
            setInterval(function(){ location.reload(); }, 1000);
        });
    }
</script>