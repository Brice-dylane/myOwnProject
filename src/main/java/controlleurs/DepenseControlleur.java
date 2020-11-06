package controlleurs;


import entites.Depense;
import operations.DepenseOperation;

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

@WebServlet(name = "Depense")
public class DepenseControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String event = request.getParameter("envent");
        DepenseOperation op = new DepenseOperation();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        if(event.equals("recherche")){
            String dateFrom = request.getParameter("from");
            String dateTo = request.getParameter("to");
            request.setAttribute("dateFrom",dateFrom);
            request.setAttribute("dateTo",dateTo);
            LocalDate start = LocalDate.parse(dateFrom,formatter1);
            LocalDate end  =  LocalDate.parse(dateTo,formatter1);
            dateFrom = start.toString();
            dateTo = end.toString();

            LocalDate lfrom = LocalDate.parse(dateFrom,formatter);
            LocalDate lto = LocalDate.parse(dateTo,formatter);
            Date from = Date.valueOf(lfrom);
            Date to = Date.valueOf(lto);
            List<Depense> list = op.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            this.getServletContext().getRequestDispatcher("/depensePage.jsp").forward(request, response);
        }
        if(event.equals("insert")){
            String titre = request.getParameter("titre");
            String prix = request.getParameter("prix");
            String description = request.getParameter("description");
            String date_dep = request.getParameter("date_dep");
            LocalDate date2 = LocalDate.parse(date_dep,formatter1);
            date_dep = date2.toString();

            LocalDate d = LocalDate.parse(date_dep,formatter);
            Depense depense = new Depense(titre,description,Integer.parseInt(prix),"Y",d);
            op.insertEntite(depense);

            LocalDate to1 = LocalDate.now();
            LocalDate from2 = to1.minusMonths(1);
            Date to = Date.valueOf(to1);
            Date from = Date.valueOf(from2);
            List<Depense> list = op.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            request.setAttribute("dateFrom",from2.toString());
            request.setAttribute("dateTo",to1.toString());

            this.getServletContext().getRequestDispatcher("/depensePage.jsp").forward(request, response);
        }
        if(event.equals("update")){

        }
        if(event.equals("delete")){
            String id = request.getParameter("id");
            op.deleteEntite(Integer.parseInt(id));

            LocalDate to1 = LocalDate.now();
            LocalDate from2 = to1.minusMonths(1);
            Date to = Date.valueOf(to1);
            Date from = Date.valueOf(from2);
            List<Depense> list = op.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            request.setAttribute("dateFrom",from2.format(formatter1).toString());
            request.setAttribute("dateTo",to1.format(formatter1).toString());
            this.getServletContext().getRequestDispatcher("/depensePage.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            DepenseOperation op = new DepenseOperation();
            LocalDate to1 = LocalDate.now();
            LocalDate from2 = to1.minusMonths(1);
            Date to = Date.valueOf(to1);
            Date from = Date.valueOf(from2);
            List<Depense> list = op.searchEntite(from,to);
            request.setAttribute("defaultList",list);
            request.setAttribute("dateFrom",from2.format(formatter1).toString());
            request.setAttribute("dateTo",to1.format(formatter1).toString());
            this.getServletContext().getRequestDispatcher("/depensePage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
