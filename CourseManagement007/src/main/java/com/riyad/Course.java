package com.riyad;

public class Course {
    private int id;
    private String courseCode;
    private String courseName;
    private int teacherId;
    private String teacherName;
    
    public Course() {}
    
    public Course(int id, String courseCode, String courseName, int teacherId, String teacherName) {
        this.id = id;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.teacherId = teacherId;
        this.teacherName = teacherName;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getCourseCode() { return courseCode; }
    public void setCourseCode(String courseCode) { this.courseCode = courseCode; }
    
    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }
    
    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }
    
    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
}