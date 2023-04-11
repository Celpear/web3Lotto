// SPDX-License-Identifier: MIT
// https://remix.ethereum.org/
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract lotto{
    address public owner;
    address[] public players;

    event UpdateWinner(address winner,uint256 balance);
    event UpdateBalance(uint256 balance);

    constructor(){
        owner = msg.sender;
    }

    function payout()public payable{
        require(msg.sender == owner,"Keine Berechtigung!");
        address payable winner = payable(players[getWinner()]);
        emit UpdateWinner(winner,address(this).balance);
        winner.transfer(address(this).balance);
    }

    function buyTicket() public payable{
        require(msg.value == 1000000000000000, "Einzahlungsbetrag muss 1 Finney sein.");
        players.push(msg.sender);
        emit UpdateBalance(address(this).balance);
    }


    uint private nonce = 0;
    function getWinner() private returns (uint){
        nonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, nonce))) % players.length;
    }
}