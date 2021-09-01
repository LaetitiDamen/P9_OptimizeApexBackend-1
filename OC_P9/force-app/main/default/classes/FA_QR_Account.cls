/**
 * @auteur:laetitia
 *@Date:14/08/2021
 * @Description:Classe reférée toutes les données des enregistrements pour l'account 
 */

public with sharing class FA_QR_Account {
    public FA_QR_Account() {

    }
    /**
     * @auteur:laetitia
     * @date:14/08/2021
     * @description: methode qui récupere account à partir de l'ID 
     */
    public Map<Id,Account> getAccountsByIds(set<Id> setAccountIds) {
        Map<Id,Account> mapAccountId = new Map<Id,Account> ([
            SELECT Id, Chiffre_d_affaire__c 
            FROM Account 
            WHERE Id in:setAccountIds 
        ]);

        return mapAccountId;
    }

}