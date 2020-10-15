package controlleurs;


import entites.Employe;
import operations.EmployeOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "Employe")
public class EmployeControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String event = request.getParameter("envent");
        EmployeOperation operation = new EmployeOperation();
        if(event.equals("insert")){
            LocalDate localDate = LocalDate.now();
            Employe employe = new Employe(request.getParameter("name"),request.getParameter("prenom"),
                    request.getParameter("sexe"),Integer.parseInt(request.getParameter("telephone")),
                    request.getParameter("cni"),request.getParameter("poste"),"Y",localDate);
            operation.insertEntite(employe);
            this.getServletContext().getRequestDispatcher("/employePage.jsp").forward(request, response);
        }
        if(event.equals("update")){

        }
        if(event.equals("delete")){
            String id = request.getParameter("id");
            operation.deleteEntite(Integer.parseInt(id));
            this.getServletContext().getRequestDispatcher("/employePage.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/employePage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
