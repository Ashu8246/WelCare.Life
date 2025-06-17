import entities.Appointment;
import model.AppointmentAuthenticator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AppointmentChecker",urlPatterns = "/AppointmentChecker")
public class AppointmentChecker extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.sendRedirect("appointment.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pid = req.getParameter("pid");
        String pname = req.getParameter("pname");
        String d_id = req.getParameter("d_id");
        String date =  req.getParameter("date");
        String time =  req.getParameter("time");
        String reason = req.getParameter("reason");
        String phone = req.getParameter("phone");


        if(pid != null && pname != null && date != null && time != null && reason != null && d_id != null)
        {
            Appointment appointment = new Appointment();
            appointment.setPid(pid);
            appointment.setPname(pname);
            appointment.setD_id(d_id);
            appointment.setDate(date);
            appointment.setTime(time);
            appointment.setReason(reason);
            appointment.setPhone(phone);

            AppointmentAuthenticator auth =  new AppointmentAuthenticator();
            boolean appoint = auth.isAppoint(appointment);

            if(appoint)
            {
                resp.sendRedirect("patientHome.jsp");
            }
            else
            {
                resp.sendRedirect("appointment.jsp");
            }
        }
        else
        {
            resp.sendRedirect("appointment.jsp");
        }
    }
}
