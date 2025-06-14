package dao;

import db.DbProvider;
import entities.Doctor;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class Display
{
    Session session = DbProvider.getSession();
    public Doctor getDoctordetails(String d_id) {

        session.beginTransaction().begin();
        Doctor doctor =  session.find(Doctor.class, d_id);
        System.out.println("doctor id : " + doctor.getD_id());
        session.getTransaction().commit();
        return doctor;
    }
}
