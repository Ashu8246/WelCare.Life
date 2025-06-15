package model;

import db.DbProvider;
import entities.Admin;
import entities.Doctor;
import entities.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class LoginAuthenticator
{

    public boolean isPatient(Patient patient)
    {
        return false;
    }

    public boolean isAdmin(Admin admin)
    {
        return false;
    }

    public boolean isDoctor(Doctor doctor)
    {
        int i=0;
        if(doctor.getD_id() != null && doctor.getPassword() != null)
        {
            try
            {
                String password = doctor.getPassword();
                Session session = DbProvider.getSession();

                Doctor doctor1 = session.find(Doctor.class, doctor.getD_id());

                if(password.equals(doctor1.getPassword()))
                {
                    doctor = doctor1;
                    return true;
                }
            }
            catch(Exception ex)
            {
                System.out.println(ex.getMessage());
            }
        }
        return false;
    }
}
