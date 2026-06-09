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
}