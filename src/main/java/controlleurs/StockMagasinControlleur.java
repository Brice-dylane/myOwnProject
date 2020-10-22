package controlleurs;


import entites.Magasin;
import operations.MagasinOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "Magasin")
public class StockMagasinControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MagasinOperation op = new MagasinOperation();
        String event = request.getParameter("envent");
        if(event.equals("recherche")){
            String cat = request.getParameter("categorie");
            String type = request.getParameter("type");
            String etat = request.getParameter("etat");

            List<Magasin> list = op.searchProMagasin(Integer.parseInt(cat),Integer.parseInt(type),etat);
            request.setAttribute("proMagasin",list);
            this.getServletContext().getRequestDispatcher("/stockmagasinPage.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            MagasinOperation op = new MagasinOperation();
            List<Magasin> list = op.searchProMagasin(0,0,"");
            request.setAttribute("proMagasin",list);
            this.getServletContext().getRequestDispatcher("/stockmagasinPage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
