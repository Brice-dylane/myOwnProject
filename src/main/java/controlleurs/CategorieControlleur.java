package controlleurs;


import entites.Categorie;
import operations.CategorieOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "Categorie")
public class CategorieControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String event = request.getParameter("envent");
        CategorieOperation categorieOperation = new CategorieOperation();
        if(event.equals("insert")){
            LocalDate localDate = LocalDate.now();
            Categorie categorie = new Categorie(request.getParameter("nom"),request.getParameter("description"),"Y",localDate);
            categorieOperation.insertEntite(categorie);
            this.getServletContext().getRequestDispatcher("/categoriePage.jsp").forward(request, response);
        }
        if(event.equals("update")){

        }
        if(event.equals("delete")){
            String id = request.getParameter("id");
            categorieOperation.deleteEntite(Integer.parseInt(id));
            this.getServletContext().getRequestDispatcher("/categoriePage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/categoriePage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
