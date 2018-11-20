package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student")
public class Student implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "fname")
    private String fname;

    @Column(name = "lname")
    private String lname;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "photo")
    private String photo;

    @Column(name = "dob")
    private String dob;

    @Column(name = "age")
    private String age;

    @Column(name = "gender")
    private String gender;

    @Column(name = "phone", unique = true)
    private String phone;

    @Column(name = "pass")
    private String pass;

    @Column(name = "cpass")
    private String cpass;

    @Column(name = "added_date")
    private String addedDate;

    public Student() {
    }

    public Student(String fname, String lname, String email, String age, String gender, String phone, String pass, String cpass, String addedDate) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.age = age;
        this.gender = gender;
        this.phone = phone;
        this.pass = pass;
        this.cpass = cpass;
        this.addedDate = addedDate;
    }

    public Student(String fname, String lname, String email, String photo, String dob, String age, String gender, String phone, String pass, String cpass, String addedDate) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.photo = photo;
        this.dob = dob;
        this.age = age;
        this.gender = gender;
        this.phone = phone;
        this.pass = pass;
        this.cpass = cpass;
        this.addedDate = addedDate;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFname() {
        return this.fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return this.lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoto() {
        return this.photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDob() {
        return this.dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAge() {
        return this.age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPass() {
        return this.pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getCpass() {
        return this.cpass;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public String getAddedDate() {
        return this.addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }

}
