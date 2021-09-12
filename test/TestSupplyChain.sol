pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    // Test for failing conditions in this contracts:
    // https://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests

    // buyItem
    SupplyChain supplyCh = SupplyChain(DeployedAddresses.SupplyChain());


    function createItem(string memory _name, uint _price) public returns(bool success) {
        success= supplyCh.addItem(_name,_price);
    }

     // test for failure if user does not send enough funds
    
    function downBadUser() {
        
    }

    // test for purchasing an item that is not for Sale
    function notForSale(uint8 _sku) {
        // create item
        // createItem("Paperback: Algo-Trade Yourself", 33 );
        // buy it
        //supplyCh.items[1].state = 3;
        // supplyCh.buyItem(1)
        // buy it again (no validation or need for)
        // "Not for Sale"
        
    }

    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped



    function testBuyStateCheck() public {
        uint sku1 = supplyCh.skuCount();
        bool successAdd = createItem("Testing in Solidity for Dummies - Book", 22);
        (string memory name, uint sku, uint price, uint state, address seller, address buyer) = supplyCh.fetchItem(sku1+1);
        address buyerBefore = buyer;

        Assert.isTrue(successAdd, "Adding item should return true");
        Assert.isZero(buyer, "Buyer address should be 0xdefault before buy.");
    }

   

}
