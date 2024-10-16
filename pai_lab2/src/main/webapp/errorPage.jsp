<%-- 
    Document   : errorPage
    Created on : 5 paź 2024, 18:29:41
    Author     : Emilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"
%>
<!DOCTYPE html>
<html>
 <head>...</head>
 <body>
 <h2>Wprowadzono błędne dane!</h2>
 <p>Pojawił się następujący błąd:
 <%= exception.getMessage() %>. <br />
 </p>
 <p><a href="calcwithbean.jsp">Powrót do kalkulatora</a></p>
 </body>
</html>
