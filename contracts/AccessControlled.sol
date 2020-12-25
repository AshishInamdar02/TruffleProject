// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AccessControlled{

    // State variables for the owner and the voting status flag.
    bool public isVoting;
    address owner;

    // Main constructor of the contract. It sets the owner of the contract and the voting status flag to false.
    constructor(address _owner, bool _isVoting){

        isVoting = _isVoting;
        owner = _owner;
        
    }
    // Define the modifiers used as part of fuction.
    modifier voteClosed{

        require(!isVoting, "Voting is currently open. Wait for it to be closed.");
        _;
    }

    modifier onlyOwner{

        require(msg.sender == owner, "Only the contract owner can perform this operation");
        _;
    }

}