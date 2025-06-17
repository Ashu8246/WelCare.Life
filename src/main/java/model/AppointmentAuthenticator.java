package model;

import db.DbProvider;
import entities.Appointment;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AppointmentAuthenticator
{
    public boolean isAppoint(Appointment appoint)
    {
        if(appoint.getPname() != null && appoint.getD_id() != null && appoint.getDate() != null && appoint.getTime() != null)
        {
            Session session = DbProvider.getSession();
            Transaction tx = session.beginTransaction();
            session.persist(appoint);
            tx.commit();
            if(tx.isActive())
            {
                tx.rollback();
            }
            return true;
        }
        return false;

    }
}
