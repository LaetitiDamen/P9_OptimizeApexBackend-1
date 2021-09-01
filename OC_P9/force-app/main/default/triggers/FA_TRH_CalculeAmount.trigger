/**
 * @auteur:laetitia
 * @Date:29/08/2021
 * @Description: Déclencheur calcule le montant commandes en net 
 */

trigger CalculMontant on Order (before update) {
	
	Order newOrder= trigger.new[0];
	newOrder.NetAmount__c = newOrder.TotalAmount - newOrder.ShipmentCost__c;
}