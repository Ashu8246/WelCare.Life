package dao;

import db.DbProvider;
import entities.Doctor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class Display
{
    Session session = DbProvider.getSession();
    public Doctor getDoctordetails(String d_id) {

        Transaction tx = session.beginTransaction();
        Doctor doctor = session.get(Doctor.class, d_id);
        session.refresh(doctor);
        tx.commit();
        if(tx.isActive())
        {
            tx.rollback();
        }
        return doctor;
    }
}
