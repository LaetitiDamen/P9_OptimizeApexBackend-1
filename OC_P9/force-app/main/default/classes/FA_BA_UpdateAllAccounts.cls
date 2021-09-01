/**
 * @auteur:laetitia
 * @Date:29/08/2021
 * @Description: Batch qui update le CA de tous les Accounts 
 */

global class Batch01AccountChiffreAffaire implements Database.Batchable<sObject>{
    
   global Database.QueryLocator start(Database.BatchableContext info){ 
       //Requeter seulement les comptes qui ont au moins une commande avec le Status 'Ordered'
       return Database.getQueryLocator('SELECT Id FROM Account');

   }
   
   
   global void execute(Database.BatchableContext info, List<Account> scope){
        //methode execute le traitement D'account afin d'updater le CA
       Set<Id> setAccountIds = (new Map<Id,SObject>(scope)).keySet();
       AP01Account.updateChiffreAffaire(setAccountIds);
   }    
    
   global void finish(Database.BatchableContext info){  
        //methode appelée lorsque tous les lots ont été traités
       
    } 
}