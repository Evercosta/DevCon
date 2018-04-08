<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>LOGIN - SISTEMA</title>
    <body>
        <div class="container"/>
            <div class="row">
                <div class="card col m6 l4 s12 offset-l4 offset-m3 grey lighten-4" style="padding: 1%">
                    <div class="row center">
                        <i class="large material-icons teal-text">account_circle</i>
                        <h4>DevCon</h4>
                    </div>
                    
                    
                    <form name="FORMLOGIN" action="validaLogin.jsp" method="post"> 
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="login" type="text" name ="LOGIN">
                                <label for="login">LOGIN</label>
                            </div>       
                        </div>
                        <div class="row">
                            <div class="input-field col s10 offset-s1 center">
                                <input id="senha" type="password" name ="SENHA">
                                <label for="senha">SENHA</label>
                            </div>       
                        </div>
                        <div class="row" onclick="$('.progress').show();">
                            <div class="col s12 center">
                                <input type="submit" name="ENVIAR" class="btn center">
                            </div>    
                        </div>
                        <div class="progress" style="display: none">
                            <div class="indeterminate"></div>
                        </div>
                    </form>
                </div>            
            </div>
        </div>
    </body>
</html>
