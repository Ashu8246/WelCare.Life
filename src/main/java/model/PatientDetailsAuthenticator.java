package model;

import db.DbProvider;
import entities.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class PatientDetailsAuthenticator
{
    public boolean isDetails(Patient patient)
    {
        if(!patient.getPid().equals("") && !patient.getGender().equals("") && !patient.getBloodgroup().equals("") && !patient.getDob().equals("") && !patient.getPhone().equals(""))
        {
            int i =0;
            try
            {
                Session session = DbProvider.getSession();
                Transaction tx = session.beginTransaction();

                Query query = session.createQuery("update patients p set p.gender = :gender,p.bloodgroup = :bloodgroup, p.phone = :phone, p.city = :city, p.dob = :dob, p.address = :address where p.p_id = :p_id");
                query.setParameter("gender", patient.getGender());
                query.setParameter("bloodgroup", patient.getBloodgroup());
                query.setParameter("phone", patient.getPhone());
                query.setParameter("city", patient.getCity());
                query.setParameter("dob", patient.getDob());
                query.setParameter("address", patient.getAddress());
                query.setParameter("p_id", patient.getPid());

                i =  query.executeUpdate();
                tx.commit();

                if(i>0)
                {
                    return true;
                }
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }
}
