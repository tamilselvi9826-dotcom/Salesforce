@isTest
private class AccountControllerTest {

    @isTest
    static void testAccountSetRating(){

        Account acc1 = new Account(
            Name='Media Account',
            Industry='Media'
        );

        Account acc2 = new Account(
            Name='Bank Account',
            Industry='Banking'
        );

        List<Account> accList =
            new List<Account>{acc1, acc2};

        AccountController.accountSetRating(accList);

        System.assertEquals('Hot', acc1.Rating);
        System.assertEquals(null, acc2.Rating);
    }
    @isTest
    static void setAccountTiers(){
        Account acc11 = new Account(Name = 'Htc', Total_Revenue__c = 7000000);
                Account acc22 = new Account(Name = 'indo', Total_Revenue__c = 7000);
        List<Account> account = new List<Account>{acc11, acc22};
          AccountController.setAccountTier(account);
         System.assertEquals('Platinum', acc11.Account_Tier__c);
        System.assertEquals(null, acc22.Account_Tier__c);

    }
}