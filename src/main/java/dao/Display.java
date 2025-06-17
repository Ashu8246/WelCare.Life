package dao;

import db.DbProvider;
import entities.Doctor;
import entities.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

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

    public List<String> getDocSpecialization()
    {
        List<String> doc = null;
        try {
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("select specialization from doctors");
            doc = (List<String>) query.list();
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doc;
    }

    public List<String> getDocLocation()
    {
        List<String> doc = null;
        try {
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("select city from doctors");
            doc = (List<String>) query.list();
            session.refresh(doc);
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doc;
    }

    public List<Doctor> getDocTable()
    {
        List<Doctor> doc = null;
        try {
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("from doctors",Doctor.class);
            doc = (List<Doctor>) query.list();
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doc;

    }
}
