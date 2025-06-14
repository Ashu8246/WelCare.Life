package dao;

import db.DbProvider;
import entities.Doctor;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class Display
{
    Session session = DbProvider.getSession();
    public Doctor getDoctordetails(String d_id) {

        session.beginTransaction();
        Doctor doctor =  session.find(Doctor.class, d_id);
        session.getTransaction().commit();
        return doctor;
    }
}
