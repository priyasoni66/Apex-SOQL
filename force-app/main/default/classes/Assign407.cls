/**
 * @author            : Priya Soni
 * @last modified on  : 10-30-2024
 * @last modified by  : Priya Soni
**/
public class Assign407 {
    public static void main(){
        List<Case> caseList = [
            SELECT Id, CaseNumber, Status
			FROM Case
        ];
        
        Map<String, List<Case>> caseByStatusMap = new Map<String, List<Case>>();
        for(Case c : caseList){
            String status = c.Status;
            if(caseByStatusMap.get(c.Status) == null){
                caseByStatusMap.put(c.Status, new List<Case>());
            }
            caseByStatusMap.get(c.Status).add(c);
        }
        System.debug('Case Grouped By Status: ' + caseByStatusMap);
    }
}