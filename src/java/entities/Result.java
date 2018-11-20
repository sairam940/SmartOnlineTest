package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "result")
public class Result implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "email")
    private String email;

    @Column(name = "sname")
    private String sname;

    @Column(name = "sub_name")
    private String subName;

    @Column(name = "faculty_email")
    private String facultyEmail;

    @Column(name = "total_question")
    private int totalQuestion;

    @Column(name = "time_duration")
    private String totalDuration;

    @Column(name = "question_attended")
    private int questionAttended;

    @Column(name = "marks_obtained")
    private int marksObtained;

    @Column(name = "total_marks")
    private int totalMarks;

    @Column(name = "percentage")
    private float percentage;

    @Column(name = "ques_level")
    private String quesLevel;

    @Column(name = "ques_set")
    private String quesSet;

    @Column(name = "remarks")
    private String remarks;

    @Column(name = "added_date")
    private String addedDate;

    @Column(name = "updated_date")
    private String updatedDate;

    public Result() {
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSname() {
        return this.sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSubName() {
        return this.subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getTotalDuration() {
        return this.totalDuration;
    }

    public void setTotalDuration(String totalDuration) {
        this.totalDuration = totalDuration;
    }

    public String getQuesLevel() {
        return this.quesLevel;
    }

    public void setQuesLevel(String quesLevel) {
        this.quesLevel = quesLevel;
    }

    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getAddedDate() {
        return this.addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }

    public String getUpdatedDate() {
        return this.updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getQuesSet() {
        return quesSet;
    }

    public void setQuesSet(String quesSet) {
        this.quesSet = quesSet;
    }

    public int getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(int totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

    public int getQuestionAttended() {
        return questionAttended;
    }

    public void setQuestionAttended(int questionAttended) {
        this.questionAttended = questionAttended;
    }

    public int getMarksObtained() {
        return marksObtained;
    }

    public void setMarksObtained(int marksObtained) {
        this.marksObtained = marksObtained;
    }

    public int getTotalMarks() {
        return totalMarks;
    }

    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }

    public String getFacultyEmail() {
        return facultyEmail;
    }

    public void setFacultyEmail(String facultyEmail) {
        this.facultyEmail = facultyEmail;
    }

}
