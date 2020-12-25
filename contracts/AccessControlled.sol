// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AccessControlled{

    // Bool variable to keep track of the voting process is active or not.
    bool public isVoting;

    // Main constructor of the contract. It sets the owner of the contract and the voting status flag to false.
    constructor(){

        isVoting = false;
    }
    // Define the modifiers used as part of fuction.
    modifier isVotingOpen{

        require(isVoting == true, "Voting process is not open.");
        _;
    }
}