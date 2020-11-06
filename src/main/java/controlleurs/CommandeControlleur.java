package controlleurs;


import operations.CommandeOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "Commande")
public class CommandeControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String event = request.getParameter("envent");
        CommandeOperation operation = new CommandeOperation();
        if(event.equals("insert")){

        }

        if(event.equals("delete")){

        }

        if(event.equals("update")){

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/commandePage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
