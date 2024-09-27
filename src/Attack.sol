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
       
    }
    
    function getBalance()public view returns(uint256){
        //returns the balance in the contract
        return address(this).balance;
    }

       
}