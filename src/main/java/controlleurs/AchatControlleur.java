package controlleurs;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Achats")
public class AchatControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/achatPage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
