package dao;

import db.DbProvider;
import entities.Doctor;
import entities.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;

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

    public Patient getPatientdetails(String p_id)
    {
        Transaction tx = session.beginTransaction();
        Patient patient  = session.get(Patient.class, p_id);
        session.refresh(patient);
        tx.commit();
        if(tx.isActive())
        {
            tx.rollback();
        }
        return patient;
    }
}
