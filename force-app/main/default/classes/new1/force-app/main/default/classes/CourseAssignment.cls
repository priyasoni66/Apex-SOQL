/**
 * @author            : Priya Soni
 * @last modified on  : 10-04-2024
 * @last modified by  : Priya Soni
**/
public with sharing class CourseAssignment {
    public CourseAssignment() {

    }
    
    public static void list1(){
        List<String> students = new List<String>();
        students.add('StudentId,Name,Email,CourseId');
        students.add('1,Ajay,ajay@gmail.com,101');
        students.add('2,Aman,aman@gmail.com,102');
        students.add('3,Bhavya,bhavya@gmail.com,101');
        students.add('4,Pragya,pragya@gmail.com,102');
        students.add('5,Suman,suman@gmail.com,'); 
        
        System.debug('Student list before assigning default course: ' + students);

        String defaultCourse = '103'; 

    
        for (String student : students) {
            List<String> studentDetails = student.split(',');
            
            if (studentDetails.size() == 4 && studentDetails[3] == '') {
                
                studentDetails[3] = defaultCourse;
                Integer index = students.indexOf(student);
                students[index] = String.join(studentDetails, ',');
            }
        }
        
        System.debug('Student list after assigning default course: ' + students);
    }

    
    public static void list2(){
        List<String> courses = new List<String>();
        courses.add('CourseId,CourseName,Instructor');
        courses.add('101,Salesforce Development,Sanjay');
        courses.add('102,Salesforce Business Analyst,Abhay');
        courses.add('103,Introduction to Salesforce,Ramesh'); 
        
        System.debug('Course list: ' + courses);
    }
}