/**
 * @auteur:laetitia
 * @Date:29/08/2021
 * @Description: Déclencheur qui update le CA des accounts 
 */

trigger UpdateAccountCA on Order (after update) {
    
    //On recupère l'ensemble des Ids
    set<Id> setAccountIds = new set<Id>();
    List<Order> ordersList = trigger.new;

    
    FA_QR_Account accountQuery = new FA_QR_Account();

    for(integer i=0; i< trigger.new.size(); i++){
        Order newOrder= trigger.new[i];
       
        //Ajout l'object Order à la requête 
         setAccountIds.add(newOrder.AccountId);
        
    }
    
    
    Map<Id,Account> mapAccountId = accountQuery.getAccountsByIds(setAccountIds);
    List<Account> accToUpdate = new List<Account>();

    
    for (Order order : ordersList){
        //[SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id =:newOrder.AccountId ];

        Account acc = mapAccountId.get(order.AccountId);
        acc.Chiffre_d_affaire__c = acc.Chiffre_d_affaire__c + order.TotalAmount;
    
        accToUpdate.add(acc);
    }
    
    update accToUpdate;
    
}