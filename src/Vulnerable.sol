// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Hackme  {

    uint256 public withdrawalLimit = 1 ether; 
    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balances;
    uint256 totalBalance;
    
    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }
    function withdrawFunds (uint256 _weiToWithdraw) public {
         
        require(balances[msg.sender] >= _weiToWithdraw);

        require(_weiToWithdraw <= withdrawalLimit);
     
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 days);        
        
        (bool success, ) = payable(msg.sender).call{value: _weiToWithdraw}("");
        if(success == true){
            balances[msg.sender] -= _weiToWithdraw;
            lastWithdrawTime[msg.sender] = block.timestamp;
            totalBalance -= _weiToWithdraw;
        }   
    }
    function getBalance () public view returns(uint256){
            return totalBalance;
    }
    function canIWithdraw(address _address) public view returns(uint256){
        return (lastWithdrawTime[_address] + 1 days);
    }
    function getTime() public view returns(uint256){
        return block.timestamp;
    }

}