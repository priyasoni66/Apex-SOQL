public class Assign302 {
    public static void main(){
        Date today = Date.today();
        List<Opportunity> oppList = [
        	SELECT Id, Name, StageName, CloseDate
			FROM Opportunity 
			WHERE CloseDate < :today
			AND StageName NOT IN ('Closed Won', 'Closed Lost')  
        ];
        List<Opportunity> updateOpp = new List<Opportunity>();
        for(Opportunity opp : oppList){
            opp.StageName = 'Closed Lost';
            updateOpp.add(opp);
        }
        if(updateOpp.size() > 0){
            update updateOpp;
        }
    }
}