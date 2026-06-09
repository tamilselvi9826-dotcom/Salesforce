public class OpportunityController {
    /*When Opportunity is created:
•	If Amount is null → block
•	If Account Rating ≠ “Hot” AND Amount > 1,000,000 → block*/
    
    /*public static void validateOpp(List<Opportunity> oppList){
        set<id> accountId = new set<id>();
      
        /*for(Opportunity opp : oppList){
            if(opp.Amount==null){
               opp.addError('enter Amount'); 
            }
            if(opp.Amount!=null&& opp.AccountId!= null){
                accountId.add(opp.AccountId);
            }
        }
        List<Opportunity> opportunit1 = [Select Account.Rating, Amount from Opportunity where Accountid IN: accountId ];
        for(Opportunity opp1 : opportunit1){
            if(opp1.Account.Rating!='Hot'&&opp1.Amount>1000000){
                opp1.addError('this opp is cannot be saved');
                
            }
        }*/
    
    public static void validateOpp(List<Opportunity> oppList){
        set<id> accountId = new set<id>();
      
        for(Opportunity opp : oppList){
            if(opp.Amount==null){
               opp.addError('enter Amount'); 
            }
            if(opp.AccountId!=null){
                accountId.add(opp.accountId);
                
            }
            Map<Id, Account> account =new Map <Id, Account> ([Select Rating From Account where Id IN: accountId ]);
            for(Opportunity opp1 : oppList){
                if(opp1.Amount!=null&&opp1.AccountId!=null&&opp1.Amount>100000&&
                   account.containsKey(opp1.AccountId)&&
                   account.get(opp1.AccountId).Rating!='Hot'){
                       opp1.addError('Opportunity cannot be saved because Account Rating is not Hot');
                   }
                    
                }
            }
        
        
        
    }  
    }