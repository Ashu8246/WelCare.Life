package model;

import db.DbProvider;
import entities.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.Random;


public class PatientRegisterAuthenticator
{
    public boolean isRegister(Patient patient)
    {
        if(!patient.getFname().isEmpty() && !patient.getLname().isEmpty() && !patient.getPassword().isEmpty() && !patient.getEmail().isEmpty())
        {
            try
            {

                int i = 0;
                Random rand = new Random();
                int randNum = rand.nextInt(1000);

                patient.setPid(patient.getFname() + randNum);

                Session session = DbProvider.getSession();

                Query query = session.createQuery("select fname from patients where email = '"+patient.getEmail()+"'");
                Patient p1 = (Patient) query.uniqueResult();

                if(p1 != null)
                {
                    return false;
                }

                Transaction tx = session.beginTransaction();

                session.persist(patient);

                tx.commit();
            }
            catch (Exception ex)
            {
                System.out.println(ex.getMessage());
                return false;
            }
            return true;

        }
        return false;
    }
}
