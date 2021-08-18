/**
 * @auteur:laetitia
 *@Date:14/08/2021
 * @Description:Classe reférée toutes les données des enregistrements pour l'account 
 */

public with sharing class FA_QR_Account {
    public FA_QR_Account() {

    }
    /**
     * 
     */
    public List<Account> getAccountsByIds(set<Id> setAccountIds) {
        List<Account> accs = [
            SELECT Id, Chiffre_d_affaire__c 
            FROM Account 
            WHERE Id in:setAccountIds 
        ];
        return accs;
    }

}
