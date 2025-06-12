package entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity(name="admins")
public class Admin
{
    @Id
    private Long id;
    private String a_id;
    private String name;
    private String password;
    private String role;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
