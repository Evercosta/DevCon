<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page import="br.com.fatec.controler.ApartamentoControler"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="br.com.fatec.controler.CondominoControler"%>
<%@page import="br.com.fatec.bean.CondAp"%>
<%@page import="br.com.fatec.controler.CondApControler"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CondApControler cpcont = new CondApControler();
    List<CondAp> cps = cpcont.listarTodosCondAp();
    
    CondominoControler condcont = new CondominoControler();
    List<Condomino> conds = condcont.listarTodosCondomino();
    ApartamentoControler apcont = new ApartamentoControler();
    List<Apartamento> aps = apcont.listarTodosApartamento();
    //Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");  
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>TABELA - CONDÔMINO/APARTAMENTO</title>
    <body>
        <%@include file="../acesso/navbar.jsp" %>
        <div class="container"/>
            <h4 class="center">LISTA DE CONDÔMINO/APARTAMENTOS</h4>           
            <table class="striped responsive-table">
                <thead>
                    <tr>
                        <th data-field="Id" class="center">Id</th>
                        <th data-field="apartamento" class="center">Apartamento</th>
                        <th data-field="condomino" class="center">Condômino</th>
                        <th class="center">Alterar</th>
                        <th class="center">Excluir</th>
                    </tr>
                 </thead>
                <% if (!(cps.isEmpty())) { %>    
                <tbody>
                    <% for (CondAp listaCondAp : cps) { %>
                        <tr >
                            <td class="center"><%=listaCondAp.getIdCondAp()%></td>
                            <td class="center">Bloco: <%=listaCondAp.getApartamento().getBloco()%>, 
                                andar: <%=listaCondAp.getApartamento().getAndar()%>, 
                                nº: <%=listaCondAp.getApartamento().getNumero()%>
                            </td>                            
                            <td class="center"><%=listaCondAp.getCondomino().getNome()%></td>
                            <td class="center">
                                <a style="cursor: pointer" 
                                   onclick="abrir_modal(<%=listaCondAp.getIdCondAp()%>,
                                   <%=listaCondAp.getCondomino().getRegCondomino() %>,
                                   <%=listaCondAp.getApartamento().getIdAp()%>)">
                                    <i class="material-icons">edit</i>
                                </a>
                            </td>
                            <td class="center">
                                <a style="cursor: pointer" 
                                   onclick="excluir(<%=listaCondAp.getIdCondAp()%>)">
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
        <a href="inserirCondAp.jsp" class="btn-floating btn-large green">
            <i class="large material-icons">add</i>
        </a>  
    </div>
    <div id="modal_edit" class="modal">
        <div class="modal-content">
            <h4 class="center">Alterar condômino/apartamento</h4>
            <form name="inserirCondAp" action="validaAlterarCondAp.jsp" method="post">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="edit_id" type="hidden" value="" name="ID">
                        <select id="edit_cond" class="browser-default" name="IDCOND">
                            <option value="" disabled selected>Escolha o condômino</option>
                            <%  if (!(conds.isEmpty())) {
                                    for (Condomino listaCondomino : conds) { %>
                                        <option value="<%=listaCondomino.getRegCondomino()%>">
                                            <%=listaCondomino.getNome()%>
                                        </option>
                                <%  }
                                } else{%>
                                    <option value="" disabled>Nenhum condômino</option>
                            <%  } %>    
                        </select>
                        <label for="edit_cond" class="active" style="padding: 0.5%">Condôminos</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <select id="edit_ap" class="browser-default" name="IDAP">
                            <option value="" disabled selected>Escolha o apartamento</option>  
                            <%  if (!(conds.isEmpty())) {
                                    for (Apartamento listaApartamento : aps) { %>
                                        <option value="<%=listaApartamento.getIdAp() %>">
                                            Bloco: <%=listaApartamento.getBloco()%> 
                                            Andar: <%=listaApartamento.getAndar()%> 
                                            Número: <%=listaApartamento.getNumero()%>
                                        </option>
                                <%  }
                                } else{%>
                                    <option value="" disabled>Nenhum condômino</option>
                            <%  } %>   
                        </select>
                        <label for="edit_ap" class="active" style="padding: 0.5%">Apartamentos</label> 
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
    function abrir_modal(id,id_cond,id_ap){
        $("#edit_id").val(id);
        $("#edit_cond").val(id_cond);
        $("#edit_ap").val(id_ap); 
        $('label').addClass('active');
        $('#modal_edit').openModal();        
    }
    function alterar(){
        var id = $("#edit_id").val();
        var cond = $("#edit_cond").val();
        var ap = $("#edit_ap").val();        
        if(cond && ap){
            $.post("validaAlterarCondAp.jsp", {ID: id, IDCOND: cond, IDAP: ap}, function(){            
                Materialize.toast('Alterando...',1000);
                setInterval(function(){ location.reload(); }, 1000);
            });    
        }else{
            alert("Faiz Favô, preencha os dados corretamente!");
        }        
    }
    function excluir(id){        
        $.post("excluirCondAp.jsp", {ID: id}, function(){            
            Materialize.toast('Excluindo...',1000);
            setInterval(function(){ location.reload(); }, 1000);
        });
    }
</script>