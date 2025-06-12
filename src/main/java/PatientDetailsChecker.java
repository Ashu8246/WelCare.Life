import entities.Patient;
import model.PatientDetailsAuthenticator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="PatientDetailsChecker", urlPatterns = "/PatientDetailsChecker")
public class PatientDetailsChecker extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String p_id = req.getParameter("p_id");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String bloodgroup = req.getParameter("bloodgroup");
        String city = req.getParameter("city");
        String phone = req.getParameter("phone");

        if(!p_id.isEmpty() && !dob.isEmpty() && !gender.isEmpty() && !address.isEmpty() && !bloodgroup.isEmpty() && !city.isEmpty() && !phone.isEmpty())
        {
            Patient patient = new Patient();
            patient.setPid(p_id);
            patient.setDob(dob);
            patient.setGender(gender);
            patient.setAddress(address);
            patient.setCity(city);
            patient.setPhone(phone);
            patient.setBloodgroup(bloodgroup);

            PatientDetailsAuthenticator auth = new PatientDetailsAuthenticator();
            boolean details = auth.isDetails(patient);
            if(details)
            {
                HttpSession session = req.getSession(true);
                session.setAttribute("patient", patient);
                resp.sendRedirect("home.jsp");
            }
            else
            {
                resp.sendRedirect("index.jsp");
            }
        }
    }
}
