/**
 * @auteur:laetitia
 *@Date:29/08/2021
 * @Description: Classe refére l'accès à la data lié au montant total des commandes pour les enregistrements Account 
 */

public without sharing class SumOrderController {
    
    FA_QR_Order orderQr = new FA_QR_Order();

    public decimal SumOders{
        get{
            AggregateResult groupedResults = orderQr.getSum();
            //[SELECT SUM(TotalAmount) total FROM Order];
			return (decimal)groupedResults.get('total');

        }
        set;
    }
}