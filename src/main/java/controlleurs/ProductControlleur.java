package controlleurs;


import entites.Produit;
import operations.ProduitOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "Produit")
public class ProductControlleur extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String event = request.getParameter("envent");
        ProduitOperation operation = new ProduitOperation();
        if(event.equals("insert")){
            LocalDate localDate = LocalDate.now();
            Produit produit = new Produit(request.getParameter("nom"),Integer.parseInt(request.getParameter("pVente")),
                    Integer.parseInt(request.getParameter("pAchat")),"Y",Integer.parseInt(request.getParameter("type")),Integer.parseInt(request.getParameter("categorie")),localDate);
            operation.insertEntite(produit);
            this.getServletContext().getRequestDispatcher("/produitPage.jsp").forward(request, response);
        }
        if(event.equals("update")){

        }
        if(event.equals("delete")){
            String id = request.getParameter("id");
            operation.deleteEntite(Integer.parseInt(id));
            this.getServletContext().getRequestDispatcher("/produitPage.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/produitPage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

}
