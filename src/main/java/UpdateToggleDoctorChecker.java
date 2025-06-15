import entities.Doctor;
import model.UpdateToggleDoctorAuthenticator;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateToggleDoctorChecker", urlPatterns = "/UpdateToggleDoctorChecker")
public class UpdateToggleDoctorChecker extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("docHome.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String type = req.getParameter("type");
        String d_id = req.getParameter("d_id");

        UpdateToggleDoctorAuthenticator auth  = new UpdateToggleDoctorAuthenticator();
        HttpSession session = req.getSession(true);
        if(d_id != null && type != null)
        {
            if(type.equalsIgnoreCase("availability")) {
                Doctor doctor = new Doctor();
                doctor.setD_id(d_id);
                boolean status = auth.isAvailability(doctor);

                if (status)
                {
                    resp.sendRedirect("docHome.jsp");
                }
                else {
                    resp.sendRedirect("docHome.jsp");
                }
            }
            else
            {
                resp.sendRedirect("docHome.jsp");
            }
        }
        else
        {
            resp.sendRedirect("docHome.jsp");
        }
    }
}
