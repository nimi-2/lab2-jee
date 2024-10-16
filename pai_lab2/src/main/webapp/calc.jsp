<%-- 
    Document   : calc
    Created on : 5 paź 2024, 13:07:23
    Author     : Emilia
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello JSP!</h1>

        <h2>Bieżąca data: 
            <%
                // Formatowanie bieżącej daty
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                String formattedDate = dateFormat.format(date);
            %>
            <%= formattedDate %>
        </h2>

        <h2>Oblicz ratę:</h2>
        <form method="get">
            Kwota: <input type="text" name="kwota" /><br>
            Oprocentowanie (%): <input type="text" name="pr" /><br>
            Liczba rat: <input type="text" name="n" /><br>
            <input type="submit" name="wyslij" value="Oblicz" />
        </form>

        <%
            if (request.getParameter("wyslij") != null) {
                String res = "";
                try {
                    // Pobranie danych z formularza
                    Double kwota = Double.parseDouble(request.getParameter("kwota"));
                    Double pr = Double.parseDouble(request.getParameter("pr")) / 100;  // Konwersja oprocentowania na wartość dziesiętną
                    int n = Integer.parseInt(request.getParameter("n"));

                    // Miesięczna stopa oprocentowania
                    Double r = pr / 12;

                    // Obliczanie raty za pomocą wzoru
                    Double rata = (kwota * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1);

                    // Formatowanie raty do dwóch miejsc po przecinku
                    DecimalFormat df = new DecimalFormat("#.00");
                    String rataf = df.format(rata);

                    res = "Twoja miesięczna rata wynosi: " + rataf + " PLN";

                } catch (Exception ex) {
                    res = "Błąd: niepoprawne dane wejściowe.";
                }
                out.println(res);
            }
        %>

    </body>
</html>
