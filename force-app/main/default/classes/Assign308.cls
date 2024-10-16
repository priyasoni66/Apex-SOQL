public class Assign308 {
    public static void main(){
    	List<Lead> leadsToUpdate = new List<Lead>();
		List<Lead> leadList = [
            SELECT Id, Email 
            FROM Lead
        ];
        for (Lead lead : leadList) {
            List<Contact> matchingContacts = [
                SELECT Id, Email
                FROM Contact
                WHERE Email = :lead.Email
                LIMIT 1
            ];
            if (matchingContacts.size() > 0) {
                lead.Possible_Duplicate__c = true;
                leadsToUpdate.add(lead);
            }
        }

        if (leadsToUpdate.size() > 0) {
            update leadsToUpdate;
            System.debug('Updated ' + leadsToUpdate.size() + ' leads with possible duplicates.');
        }
    }
}