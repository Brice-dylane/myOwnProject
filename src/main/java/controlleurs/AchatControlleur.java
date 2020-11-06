package controlleurs;


import entites.Achat;
import operations.AchatOperation;
import operations.ProduitOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "Achats")
public class AchatControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String event = request.getParameter("envent");
        AchatOperation achatOperation = new AchatOperation();
        if(event.equals("insert")){
            String id_pro = request.getParameter("id_pro");
            String qte = request.getParameter("qte");
            int qteValue = ProduitOperation.conversionEnBouteille(Integer.parseInt(qte),Integer.parseInt(id_pro));

            String prix_total = request.getParameter("prix_total");
            String date = request.getParameter("date_achat");
            LocalDate date1 = LocalDate.parse(date,formatter1);
            date = date1.toString();
            LocalDate finalDate = LocalDate.parse(date,formatter);
            Achat achat = new Achat(Integer.parseInt(id_pro),qteValue,Integer.parseInt(prix_total),"Y",finalDate);
            achatOperation.insertEntite(achat);

            LocalDate to1 = LocalDate.now();
            LocalDate from2 = to1.minusMonths(1);
            Date to = Date.valueOf(to1);
            Date from = Date.valueOf(from2);
            List<Achat> list = achatOperation.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            request.setAttribute("dateFrom",from2.toString());
            request.setAttribute("dateTo",to1.toString());
            this.getServletContext().getRequestDispatcher("/achatPage.jsp").forward(request, response);
        }
        if(event.equals("recherche")){

            String dateFrom = request.getParameter("from");
            String dateTo = request.getParameter("to");
            request.setAttribute("dateFrom",dateFrom.toString());
            request.setAttribute("dateTo",dateTo.toString());
            LocalDate start = LocalDate.parse(dateFrom,formatter1);
            LocalDate end  =  LocalDate.parse(dateTo,formatter1);
            dateFrom = start.toString();
            dateTo = end.toString();

            LocalDate lfrom = LocalDate.parse(dateFrom,formatter);
            LocalDate lto = LocalDate.parse(dateTo,formatter);
            Date from = Date.valueOf(lfrom);
            Date to = Date.valueOf(lto);
            List<Achat> list = achatOperation.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            this.getServletContext().getRequestDispatcher("/achatPage.jsp").forward(request, response);

        }
        if(event.equals("delete")){

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            AchatOperation achatOperation = new AchatOperation();
            LocalDate to1 = LocalDate.now();
            LocalDate from2 = to1.minusMonths(1);
            Date to = Date.valueOf(to1);
            Date from = Date.valueOf(from2);
            List<Achat> list = achatOperation.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            request.setAttribute("dateFrom",from2.format(formatter1).toString());
            request.setAttribute("dateTo",to1.format(formatter1).toString());
            this.getServletContext().getRequestDispatcher("/achatPage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
