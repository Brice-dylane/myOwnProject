package controlleurs;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserPage")
public class UserPageControlleur extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setAttribute("username",userName);

        this.getServletContext().getRequestDispatcher("/userPage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            this.getServletContext().getRequestDispatcher("/userPage.jsp").forward(request, response);
        }
        else {
            this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
