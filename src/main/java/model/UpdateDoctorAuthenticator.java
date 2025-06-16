package model;

import db.DbProvider;
import entities.Doctor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UpdateDoctorAuthenticator
{
    Session session = DbProvider.getSession();

    public boolean isAvailability(Doctor doctor)
    {
        String d_id = doctor.getD_id();
        int i=0;
        if(doctor != null)
        {
            try
            {
                Transaction tx = session.beginTransaction();
                Query query = session.createQuery("update doctors d set d.status = case when d.status = 1 then 0 else 1 end where d.d_id = :id");
                query.setParameter("id",d_id);
                i=query.executeUpdate();

                doctor = session.get(Doctor.class, doctor.getD_id());
                session.refresh(doctor);

                tx.commit();


                if(tx.isActive())
                {
                    tx.rollback();
                }
                if(i>0)
                {
                    return true;
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        }
        return false;
    }
}
