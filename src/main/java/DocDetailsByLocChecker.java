import dto.DoctorDto;
import model.DocDetailsByLocAuthenticator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DocDetailsByLocChecker",urlPatterns = "/DocDetailsByLocChecker")
public class DocDetailsByLocChecker extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String referer = req.getHeader("Referer");
        String loc = req.getParameter("loc");

        if(loc!=null)
        {
            DocDetailsByLocAuthenticator auth = new DocDetailsByLocAuthenticator();
            List<DoctorDto> docDetails = auth.isDetailsByLoc(loc);

            if(docDetails!=null)
            {
                HttpSession session = req.getSession(true);
                session.setAttribute("docDetails", docDetails);
                resp.sendRedirect(referer);
            }
            else {
                resp.sendRedirect(referer);
            }
        }
        else {
            resp.sendRedirect(referer);
        }
    }
}
