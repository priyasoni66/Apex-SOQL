public class Assign306 {
    public static void main() {
        List<Opportunity> newOpportunities = [
            SELECT Id, Name
            FROM Opportunity
            WHERE CreatedDate = LAST_N_DAYS:7
        ];

        List<Product2> predefinedProducts = [
            SELECT ExternalId, Name
            FROM Product2
            WHERE Name IN ('Demo', 'xyz') 
        ];

        List<PricebookEntry> pricebookEntries = [
            SELECT Id, Product2Id, UnitPrice, Pricebook2Id
            FROM PricebookEntry
            WHERE Product2Id IN :predefinedProducts
            AND IsActive = true
        ];

        List<OpportunityLineItem> lineItemsToInsert = new List<OpportunityLineItem>();
        for (Opportunity opp : newOpportunities) {
            for (PricebookEntry pbe : pricebookEntries) {
                OpportunityLineItem oli = new OpportunityLineItem();
                oli.OpportunityId = opp.Id;
                oli.PricebookEntryId = pbe.Id;
                oli.Quantity = 1; 
                oli.UnitPrice = pbe.UnitPrice;
                lineItemsToInsert.add(oli);
            }
        }

        if (!lineItemsToInsert.isEmpty()) {
            insert lineItemsToInsert;
            System.debug('Inserted ' + lineItemsToInsert.size() + ' OpportunityLineItem records.');
        } else {
            System.debug('No line items to insert.');
        }
    }
}