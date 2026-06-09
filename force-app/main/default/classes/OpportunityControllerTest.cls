@isTest
private class OpportunityControllerTest {

    @isTest
    static void testValidateOpp() {

        Account hotAcc = new Account(
            Name = 'Hot Account',
            Rating = 'Hot'
        );

        Account coldAcc = new Account(
            Name = 'Cold Account',
            Rating = 'Cold'
        );

        insert new List<Account>{hotAcc, coldAcc};

        Opportunity opp1 = new Opportunity(
            Name = 'Opp Without Amount',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            AccountId = hotAcc.Id
        );

        Opportunity opp2 = new Opportunity(
            Name = 'Opp High Amount Cold Account',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 200000,
            AccountId = coldAcc.Id
        );

        Opportunity opp3 = new Opportunity(
            Name = 'Opp High Amount Hot Account',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 200000,
            AccountId = hotAcc.Id
        );

        List<Opportunity> oppList =
            new List<Opportunity>{opp1, opp2, opp3};

        Test.startTest();

        OpportunityController.validateOpp(oppList);

        Test.stopTest();

        System.assertEquals(
            true,
            opp1.getErrors().size() > 0
        );

        System.assertEquals(
            true,
            opp2.getErrors().size() > 0
        );

        System.assertEquals(
            0,
            opp3.getErrors().size()
        );
    }
}