package com.riyad;

import com.riyad.Course;
import com.riyad.User;
import com.riyad.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    public boolean addCourse(Course course) {
        String query = "INSERT INTO courses (course_code, course_name, teacher_id) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, course.getCourseCode());
            stmt.setString(2, course.getCourseName());
            stmt.setInt(3, course.getTeacherId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.*, u.full_name as teacher_name FROM courses c " +
                       "LEFT JOIN users u ON c.teacher_id = u.id";
        
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setTeacherId(rs.getInt("teacher_id"));
                course.setTeacherName(rs.getString("teacher_name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return courses;
    }
    
    public List<User> getAllTeachers() {
        List<User> teachers = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'teacher'";
        
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                User teacher = new User();
                teacher.setId(rs.getInt("id"));
                teacher.setUsername(rs.getString("username"));
                teacher.setFullName(rs.getString("full_name"));
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return teachers;
    }
    
    public List<User> getAllStudents() {
        List<User> students = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'student' ORDER BY full_name";
        
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                User student = new User();
                student.setId(rs.getInt("id"));
                student.setUsername(rs.getString("username"));
                student.setFullName(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return students;
    }
    
    public List<Course> getCoursesByStudentId(int studentId) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.*, u.full_name as teacher_name FROM courses c " +
                       "LEFT JOIN users u ON c.teacher_id = u.id " +
                       "INNER JOIN student_courses sc ON c.id = sc.course_id " +
                       "WHERE sc.student_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setTeacherId(rs.getInt("teacher_id"));
                course.setTeacherName(rs.getString("teacher_name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return courses;
    }
    
    public List<Course> getAvailableCourses(int studentId) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.*, u.full_name as teacher_name FROM courses c " +
                       "LEFT JOIN users u ON c.teacher_id = u.id " +
                       "WHERE c.id NOT IN (SELECT course_id FROM student_courses WHERE student_id = ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setTeacherId(rs.getInt("teacher_id"));
                course.setTeacherName(rs.getString("teacher_name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return courses;
    }
    
    public boolean enrollCourse(int studentId, int courseId) {
        String query = "INSERT INTO student_courses (student_id, course_id) VALUES (?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Course> getCoursesByTeacherId(int teacherId) {
        List<Course> courses = new ArrayList<>();
        String query = "SELECT c.*, u.full_name as teacher_name FROM courses c " +
                       "LEFT JOIN users u ON c.teacher_id = u.id " +
                       "WHERE c.teacher_id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, teacherId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setTeacherId(rs.getInt("teacher_id"));
                course.setTeacherName(rs.getString("teacher_name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return courses;
    }
    
    public List<User> getStudentsByCourseId(int courseId) {
        List<User> students = new ArrayList<>();
        String query = "SELECT u.* FROM users u " +
                       "INNER JOIN student_courses sc ON u.id = sc.student_id " +
                       "WHERE sc.course_id = ? AND u.role = 'student'";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, courseId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                User student = new User();
                student.setId(rs.getInt("id"));
                student.setUsername(rs.getString("username"));
                student.setFullName(rs.getString("full_name"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return students;
    }
}
