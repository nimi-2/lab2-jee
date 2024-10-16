<%@page import="bd.pai_lab2.LoanBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %> <!-- Ustawienie strony błędu -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kalkulator kredytowy z LoanBean</title>
    </head>
    <body>
        <h1>Kalkulator kredytowy</h1>

        <jsp:useBean id="loan" class="bd.pai_lab2.LoanBean" scope="session" />
        <jsp:setProperty name="loan" property="*" />

        <h2>Wprowadź dane:</h2>
        <form method="get">
            Kwota pożyczki: 
            <input name='kwota' value="<%= loan.getKwota() %>"/><br>

            Oprocentowanie (%): 
            <input name='pr' value="<%= loan.getPr() %>"/><br>

            Liczba rat: 
            <input name='n' value="<%= loan.getN() %>"/><br>

            <input type="submit" name="wyslij" value="Oblicz" />
        </form>

        <%
            if (request.getParameter("wyslij") != null) {
                try {
                    // Wywołanie metody getRata() z LoanBean
                    double rata = loan.getRata();

                    // Formatowanie wyniku
                    java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
                    String rataFormatted = df.format(rata);

                    out.println("<h3>Twoja miesięczna rata wynosi: " + rataFormatted + " PLN</h3>");
                } catch (Exception ex) {
                    // Wyrzucenie wyjątku - przekierowanie do strony obsługi błędów
                    throw new RuntimeException("Błąd: Niepoprawne dane wejściowe", ex);
                }
            }
        %>
    </body>
</html>
