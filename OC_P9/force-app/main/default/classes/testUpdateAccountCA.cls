@isTest
private class TestUpdateAccountCA {
    @isTest static void test() {
        Account account1 = new Account(Name = 'Test Account 1');
        insert account1;

        Product2 product1 = new Product2(Name = 'Chemise Verte longue XYX', Family = 'Chemise');
        Insert product1;
 
        //Create the PricebookEntry
        PricebookEntry priceBookEntry = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = product1.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert priceBookEntry;

        Order order1 = new Order(AccountId = account1.Id);
        insert order1;

        OrderItem orderItem1 = new OrderItemItem (OrderId = order1.Id, PricebookEntryId = priceBookEntry.Id, Quantity=10, UnitPrice = 150);
        insert orderItem1;
        OrderItem orderItem2 = new OrderItemItem (OrderId = order1.Id, PricebookEntryId = priceBookEntry.Id, Quantity=20, UnitPrice = 1000);
    }
}
