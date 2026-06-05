public class AccountController {
    public static void accountSetRating(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
}