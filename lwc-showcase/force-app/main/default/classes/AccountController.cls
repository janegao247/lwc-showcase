public with sharing class AccountController {

    @AuraEnabled(Cacheable=true)
    public static List<Account> GetFinancialAccount() {
        AccountSelector acctSelector = new AccountSelector();
    
        return acctSelector.selectAccountsByIndustry(AccountIndustry.FINANCIAL);
      }

    @AuraEnabled( cacheable = true )
    public static List< Account > GetAccountsWithNameLike( String searchKey ) {
      AccountSelector acctSelector = new AccountSelector();
      String strKey = '%' + searchKey + '%';
      return acctSelector.GetAccountsWithNameLike(AccountIndustry.FINANCIAL, strKey);   
    }
}
