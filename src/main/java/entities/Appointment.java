package entities;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

@Entity(name = "appointments")
@Table(name = "appointments")
public class Appointment
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @ColumnDefault("754372")
    private int reason_id;
    private String pid;
    private String d_id;
    private String name;
    private String reason;
    private String age;
    private String bloodgroup;
    private String city;
    private String date;
    private String time;
    private String phone;
    private String status = "Pending";

    public int getReason_id() {
        return reason_id;
    }

    public void setReason_id(int reason_id) {
        this.reason_id = reason_id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getD_id() {
        return d_id;
    }

    public void setD_id(String d_id) {
        this.d_id = d_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "reason_id=" + reason_id +
                ", pid='" + pid + '\'' +
                ", d_id='" + d_id + '\'' +
                ", name='" + name + '\'' +
                ", reason='" + reason + '\'' +
                ", age='" + age + '\'' +
                ", bloodgroup='" + bloodgroup + '\'' +
                ", city='" + city + '\'' +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", phone='" + phone + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
