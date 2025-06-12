package model;

import db.DbProvider;
import entities.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Random;


public class PatientRegisterAuthenticator
{
    public boolean isRegister(Patient patient)
    {
        if(!patient.getFname().isEmpty() && !patient.getLname().isEmpty() && !patient.getPassword().isEmpty() && !patient.getEmail().isEmpty())
        {
            int i=0;
            Random rand = new Random();
            int randNum = rand.nextInt(1000);

            patient.setPid(patient.getFname() + randNum);

            Session session = DbProvider.getSession();
            Transaction tx = session.beginTransaction();

            session.persist(patient);

            tx.commit();

            return true;

        }
        return false;
    }
}
