/**
 * @name TestDataFactory
 * @description Contains methods to construct and/or validate commonly used records
**/

public with sharing class TestDataFactory {

    public TestDataFactory() {
        
    }

    /**
     * @name AccountBuilder 
     * @description Constructs a account record for unit tests
    **/
    public static AccountBuilder accountBuilder(){
        return new AccountBuilder();

    }

    public class AccountBuilder {

        account account1 = new account();
        public AccountBuilder () {

        }
        //Create account
          public AccountBuilder createAccount () {
              account1.Active__c = 'Yes';
              account1.Name = 'testdavid';
              account1.Phone = '0654342345';

              return this;
          }

          //Build Account
          public Account build (){
              return  this.account1;
          }
    
        }


    /**
     * @name  OrderBuilder
     * @description Constructs a order record for unit tests
    **/
    public static OrderBuilder orderBuilder(){
        return new OrderBuilder();

    }


    public class OrderBuilder {

        order order1 = new order();
        account account = new account();

        public OrderBuilder setAccountId ( String AccountId){
         //account = order.Account;
         this.order1.AccountId = AccountId;
         return this;
        }


        public OrderBuilder () {

        }
        //Create order
          public OrderBuilder createOrder () {
              //order1 = order1.setAccountId();
              order1.Name = 'NameTest';
              order1.Status = 'Draft';
              order1.EffectiveDate = System.today();

              return this;
          }

          //Build Order
          public Order build (){
              return  this.order1;
          }
    
        }

        /**
        * @name  PriceBuilder
        * @description Constructs a price record for unit tests
        **/
        public static PriceBuilder priceBuilder() {
            return new PriceBuilder();
        
            }
        
            public class PriceBuilder {
        
                PricebookEntry priceBookEntry = new PricebookEntry();
                public PriceBuilder () {
        
                }
                //Create the PricebookEntry
                public PriceBuilder createPrice () {
                    priceBookEntry.Pricebook2Id = Test.getStandardPricebookId();
                    //priceBookEntry.Product2Id = '';
                    priceBookEntry.UnitPrice = 20000.00;
                    priceBookEntry.IsActive = False;
    
                return this;
             }
             public PriceBuilder setProduct ( String productId){
               this.priceBookEntry.Product2Id = productId;
               return this;
              }
        
                  //Build Price
                  public PricebookEntry build (){
                      return  this.priceBookEntry;
                    }
            
            }

   

            /**
            * @name  ProductBuilder
            * @description Constructs a product record for unit tests
            **/
            public static ProductBuilder productBuilder() {
                return new ProductBuilder();
            
                }
            
                public class ProductBuilder {
            
                    Product2 product1 = new Product2();
                    public ProductBuilder () {
            
                    }
                    //Create the Product
                    public ProductBuilder createProduct () {
                        product1.Name = 'Chemise Verte longue XYX';
                        product1.Family = 'Chemise';
        
                    return this;
                 }
            
            
                      //Build Product
                      public Product2 build (){
                          return  this.product1;
                        }
                
                }
}