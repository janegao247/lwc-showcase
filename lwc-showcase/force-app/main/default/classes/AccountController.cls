public with sharing class AccountController {
    @AuraEnabled( cacheable = true )
    public static List< Account > GetFinancialAccountsWithNameLike( String searchKey ) {
      AccountSelector acctSelector = new AccountSelector();
      if(searchKey == null){
        return acctSelector.selectAccountsByIndustry(AccountIndustry.FINANCIAL);   
      }else{
        String strKey = '%' + searchKey + '%';
        return acctSelector.selectAccountsByIndustryWithNameLike(AccountIndustry.FINANCIAL, strKey);
      }
    }
}
