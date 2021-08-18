trigger UpdateAccountCA on Order (after update) {
	
    set<Id> setAccountIds = new set<Id>();
    
    FA_QR_Account accountQuery = new FA_QR_Account();

    for(integer i=0; i< trigger.new.size(); i++){
        Order newOrder= trigger.new[i];
       
         setAccountIds.add(newOrder.AccountId);
        
    }
    
    List<Account> accs = accountQuery.getAccountById(setAccountIds);
    List<Account> accToUpdate = new List<Account>();

    
        for (Account acc : accs){
    //[SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id =:newOrder.AccountId ];
    acc.Chiffre_d_affaire__c = acc.Chiffre_d_affaire__c + newOrder.TotalAmount;
    
    accToUpdate.add(acc);
    }
    update accToUpdate;
    
}