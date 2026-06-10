public class AccountController {
    /*When Account is created:
If Industry = “Media”
Set Rating = “Hot*/
public static void  setRatingHot(List<Account> accList){
        for(Account acc : accList) {
            if(acc.Industry=='Media'){
               acc.Rating ='Hot' ;
            }
        }  
    }
    /*If Account Tier becomes “Platinum”:
•	Update all related Opportunities
→ Priority = High*/
    public static void setOPPRating(List<Account> accList){
        set<Id> accountId = new set<Id>();
        for(Account acc: accList){
            if(acc.Tier__c=='Platinum'){
                accountId.add(acc.id);
            }
        }
        List<Opportunity> opp = [Select Priority__c from Opportunity Where AccountId IN: accountId];
        List<Opportunity> insertOpp = new List<Opportunity>();
        for(Opportunity oppList : opp){
            oppList.Priority__c = 'High';
                    insertOpp.add(oppList);

        }
        update insertOpp;
        
        

    }
    
    
}