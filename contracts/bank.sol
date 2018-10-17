pragma solidity ^0.4.17;

contract Bank {

  //initialize balances mapping
  mapping (address => uint256) balances;

  //allows anyone to deposit funds
  function makeDeposit() public payable {
    balances[msg.sender] += msg.value;
  }

  //allows anyone to check their balance
  function checkBalance() constant public returns (uint256 balance){
    return balances[msg.sender];
  }

  //allows anyone to withdraw funds, provided they hace claim to that amount
  function makeWithdrawal(uint256 amount) public returns (bool success) {
    if (balances[msg.sender] >= amount) {
      balances[msg.sender] -= amount;
      msg.sender.transfer(amount);
      return true;
    } else {
      return false;
    }
  }

  //fallback, to account for calls to functions nonexistent within contract
  function () public payable {
    revert();
  }

}
