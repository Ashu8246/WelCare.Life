import entities.Doctor;
import model.LoginAuthenticator;
import org.apache.catalina.authenticator.NonLoginAuthenticator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginChecker" ,urlPatterns = "/LoginChecker")
public class LoginChecker extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String u_id=req.getParameter("u_id");
        String password=req.getParameter("password");
        String role=req.getParameter("role");

        LoginAuthenticator auth = new LoginAuthenticator();
        HttpSession session = req.getSession(true);

        if(role.equalsIgnoreCase("admin"))
        {
            if(u_id !=  null && password != null)
            {

            }
        }
        else if(role.equalsIgnoreCase("patient"))
        {
            if(u_id !=  null && password != null)
            {

            }
        }
        else if(role.equalsIgnoreCase("doctor"))
        {
            if(u_id !=  null && password != null)
            {
                Doctor doctor = new Doctor();
                doctor.setD_id(u_id);
                doctor.setPassword(password);

                boolean login = auth.isDoctor(doctor);

                if(login)
                {
                    session.setAttribute("d_id", doctor.getD_id());
                    resp.sendRedirect("docHome.jsp");
                }
            }
            else
            {
                resp.sendRedirect("index.jsp");
            }
        }
        else
        {
            resp.sendRedirect("index.jsp");
        }
    }

}
