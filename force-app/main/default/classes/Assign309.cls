public class Assign309 {
    public static void main(){
        List<Resource__c> resourceList = [
            SELECT Id, Resource_A__c, Resource_B__c, Side_A_Count__c, Side_B_Count__c 
            FROM Resource__c
            WHERE Resource_A__c != NULL OR Resource_B__c != NULL
        ];

        List<Resource__c> resourcesToUpdate = new List<Resource__c>();

        for (Resource__c res : resourceList) {
            Integer sideACount = 0;
            Integer sideBCount = 0;

            if (res.Resource_A__c != NULL) {
                sideACount++;
            }

            if (res.Resource_B__c != NULL) {
                sideBCount++;
            }

            res.Side_A_Count__c = sideACount;
            res.Side_B_Count__c = sideBCount;
            resourcesToUpdate.add(res);
        }

        if (resourcesToUpdate.size() > 0) {
            update resourcesToUpdate;
            System.debug('Updated ' + resourcesToUpdate.size() + ' resources with side counts.');
        }
    }
}