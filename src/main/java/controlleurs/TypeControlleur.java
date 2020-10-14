package controlleurs;

import entites.Type;
import operations.TypeOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

@WebServlet(name = "Type")
public class TypeControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String event = request.getParameter("envent");
        TypeOperation typeOperation = new TypeOperation();
        if(event.equals("insert")){
            LocalDate localDate = LocalDate.now();
            Type type = new Type(request.getParameter("nom"), request.getParameter("description"),
                    Integer.parseInt(request.getParameter("qteBouteille")),"Y", localDate);
            typeOperation.insertEntite(type);
            this.getServletContext().getRequestDispatcher("/typePage.jsp").forward(request, response);
        }

        if(event.equals("update")){

        }

        if(event.equals("delete")){
            String id = request.getParameter("id");
            typeOperation.deleteEntite(Integer.parseInt(id));
            this.getServletContext().getRequestDispatcher("/typePage.jsp").forward(request, response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/typePage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
