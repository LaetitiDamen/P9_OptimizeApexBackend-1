/**
 * @auteur:laetitia
 *@Date:14/08/2021
 * @Description:Classe reférée toutes les données des enregistrements pour les commandes 
 */

public with sharing class FA_QR_Order {
    public FA_QR_Order() {

    }

    //methode qui récupère la somme totale d'une commmande 
    public AggregateResult getSum () {
        AggregateResult sum = [SELECT SUM(TotalAmount) total FROM Order];

        return sum;

    }
    //methode qui récupère la liste des commandes 
    public list<Order> getOrders() {
        list<Order> listOrders =  [
            SELECT Id, TotalAmount, AccountId 
            FROM Order
        ];

        return listOrders;


    }
}