package model;

import db.DbProvider;
import dto.DoctorDto;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class DocDetailsByLocAuthenticator
{
    public List<DoctorDto> isDetailsByLoc(String loc)
    {
        if(loc!=null && !loc.equalsIgnoreCase(""))
        {
            Session session = DbProvider.getSession();
            Transaction tx = session.beginTransaction();

            Query query = session.createQuery("from doctors where city ='"+loc+"'");
            List<DoctorDto> doctor = (List<DoctorDto>) query.getResultList();
            tx.commit();
            if(tx.isActive())
            {
                tx.rollback();
                return doctor;
            }
        }
        return null;
    }
}
