<%@page import="br.com.fatec.bean.Apartamento"%>
<%@page import="br.com.fatec.controler.ApartamentoControler"%>
<%@page import="br.com.fatec.bean.Condomino"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatec.controler.CondominoControler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CondominoControler condcont = new CondominoControler();
    List<Condomino> conds = condcont.listarTodosCondomino();
    ApartamentoControler apcont = new ApartamentoControler();
    List<Apartamento> aps = apcont.listarTodosApartamento();
    //Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");  
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>INSERIR - CONDÔMINO/APARTAMENTO</title>
    <body>
        <%@include file="../acesso/navbar.jsp" %>
        <div class="row">
            <div class="card col s12 m8 l4 offset-l4 offset-m2 grey lighten-4">
                <div class="row center">
                    <i class="large material-icons teal-text">contacts</i>
                    <h4>Adicionar Condômino/Apartamento</h4>
                    <form name="inserirCondAp" action="validaInserirCondAp.jsp" method="post">
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <select id="list_cond" class="browser-default" name="IDCOND">
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
                                <label for="list_cond" class="active" style="padding: 0.5%">Condôminos</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <select id="list_ap" class="browser-default" name="IDAP">
                                    <option value="" disabled selected>Escolha o apartamento</option>  
                                    <%  if (!(conds.isEmpty())) {
                                            for (Apartamento listaApartamento : aps) { %>
                                                <option value="<%=listaApartamento.getIdAp()%>">
                                                    Bloco: <%=listaApartamento.getBloco()%> 
                                                    Andar: <%=listaApartamento.getAndar()%> 
                                                    Número: <%=listaApartamento.getNumero()%>
                                                </option>
                                        <%  }
                                        } else{%>
                                            <option value="" disabled>Nenhum condômino</option>
                                    <%  } %>   
                                </select>
                                <label for="list_ap" class="active" style="padding: 0.5%">Apartamentos</label>   
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
            <a href="listarCondAp.jsp" class="btn-floating btn-large purple">
                <i class="large material-icons">list</i>
            </a>  
        </div>
    </body>
</html>
<script>
    function inserir(){
        var cond = $('#list_cond').val();
        var ap = $('#list_ap').val();
        if(cond && ap){
            $.post("validaInserirCondAp.jsp", {IDCOND: cond, IDAP: ap}, function(){            
                Materialize.toast('Inserindo...',1000);
                setInterval(function(){ location.reload(); }, 1000);
            });    
        }else{
            alert("Faiz Favô, preencha os dados corretamente!");
        }        
    }    
</script>