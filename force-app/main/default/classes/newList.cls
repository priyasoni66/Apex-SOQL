/**
 * @author            : Priya Soni
 * @last modified on  : 10-04-2024
 * @last modified by  : Priya Soni
**/

// Create a new list that contains the student name and the name of the courses they are enrolled in.
public with sharing class newList {
    public newList() {
    }

    public static void main() {
        List<String> student = new List<String>();
        student.add('1,Ajay,ajay@gmail.com,101');
        student.add('2,Aman,aman@gmail.com,102');
        student.add('3,Bhavya,bhavya@gmail.com,101');
        student.add('4,Pragya,pragya@gmail.com,102');
        student.add('5,Suman,suman@gmail.com,103');
        System.debug('Student list: ' + student);

        List<String> course = new List<String>();
        course.add('101,Salesforce Development,Sanjay');
        course.add('102,Salesforce Business Analyst,Abhay');
        course.add('103,Introduction to Salesforce,Ramesh');
        System.debug('Course list: ' + course);

        Map<String, String> courseMap = new Map<String, String>();
        for (String record : course) {
            List<String> courseDetails = record.split(',');
            courseMap.put(courseDetails[0], courseDetails[1]); 
        }

        List<String> studentWithCourse = new List<String>();

        for (String record1 : student) {
            List<String> studentDetails = record1.split(',');
            String studentName = studentDetails[1];
            String courseId = studentDetails[3];
            String courseName = courseMap.get(courseId);

            studentWithCourse.add(studentName + ' is enrolled in ' + courseName);
        }

        System.debug('Student with course list: ' + studentWithCourse);
    }
}