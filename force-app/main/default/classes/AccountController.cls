public class AccountController {
    public static void accountSetRating(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    /*Update Account Total_Revenue__c

If Total_Revenue__c > 5,000,000
→ Set Account Tier__c = “Platinum”*/
    public static void setAccountTier(List<Account> account){
        for(Account acc: account){
            if(acc.Total_Revenue__c>5000000){
                acc.Account_Tier__c='Platinum';
            }
        }
        
    }
    /*If Account Tier becomes “Platinum”:

Update all related Opportunities
→ Priority = High*/
    public static void updateOpportunity(List<Account> accountList, Map<id, Account> oldValue){
        set<id> accountId = new set<id>();
        for(Account acc : accountList){
            if(acc.Account_Tier__c=='Platinum' && oldValue.get(acc.Id).Account_Tier__c!='Platinum'){
                accountId.add(acc.Id);
                
            }
            
            
        }
        
        List<Opportunity> opp = [select Prioriry__c , AccountId from Opportunity where AccountId IN: accountId ];
        for(Opportunity opps : opp){
            opps.Prioriry__c = 'high';
        }
        update opp;
        
        
        
    }
}