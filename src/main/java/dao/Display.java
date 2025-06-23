package dao;

import db.DbProvider;
import entities.Appointment;
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

    public List<Doctor> getDocTable()
    {
        List<Doctor> doc = null;
        try {
            Transaction tx = session.beginTransaction();
            Query<Doctor> query = session.createQuery("from doctors where verified = 'Verified'", Doctor.class);
            doc = query.list();
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
            return doc;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doc;

    }

    public List<Doctor> getDocTableForAdmin()
    {
        List<Doctor> doc = null;
        try {
            Transaction tx = session.beginTransaction();
            Query<Doctor> query = session.createQuery("from doctors", Doctor.class);
            doc = query.list();
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
            return doc;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return doc;

    }

    public List<Appointment> getAppointmentDetails(String d_id)
    {
        List<Appointment> appoint = null;
        try {
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("from appointments where d_id=:d_id",Appointment.class);
            query.setParameter("d_id",d_id);
            appoint = query.list();
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
            return appoint;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return appoint;
    }

    public List<Appointment> getAppointmentDetailsPid(String pid)
    {
        List<Appointment> appoint = null;
        try {
            Transaction tx = session.beginTransaction();
            appoint = session.createQuery("from appointments where pid='"+pid+"'",Appointment.class).list();;
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
            return appoint;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return appoint;
    }

    public Appointment getAppointmentDetailsReason_id(String reason_id)
    {
        Appointment appoint = null;
        try {
            Transaction tx = session.beginTransaction();
            appoint = session.get(Appointment.class, reason_id);
            tx.commit();
            if (tx.isActive()) {
                tx.rollback();
            }
            return appoint;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return appoint;

    }
}
