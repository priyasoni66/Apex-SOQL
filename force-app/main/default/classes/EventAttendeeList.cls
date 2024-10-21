/**
 * @author            : Priya Soni
 * @last modified on  : 10-05-2024
 * @last modified by  : Priya Soni
**/

public with sharing class EventAttendeeList {
    
    public EventAttendeeList() {
    }

    public static void main() {
        List<List<String>> EventList = new List<List<String>>{
            new List<String>{'EventId', 'EventName', 'MaxCapacity', 'AttendeeCount'},
            new List<String>{'1', 'Event1', '100', '20'},
            new List<String>{'2', 'Event2', '200', '40'},
            new List<String>{'3', 'Event3', '300', '80'}
        };

        List<List<String>> AttendeeList = new List<List<String>>{
            new List<String>{'AttendeeId', 'Name', 'RegisteredEventIds'},
            new List<String>{'1', 'Suman', '2'},
            new List<String>{'2', 'Sharad', '1'},
            new List<String>{'3', 'Jay', '3'}
        };

        System.debug(EventList);
        System.debug(AttendeeList);
    }
}