// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Voting{
    
    
    bool public isVoting;

    // Vote Struct. It defines a custom type to be used to store values for every vote received.
    struct Vote{

        address receiver;
        uint256 timestamp;
    }

    // The main votes state variable for the type 'mapping'. A hash map of all votes collected from each voter.
    mapping(address => Vote) public votes;

    //Define the events to emit.
    event AddVote(address indexed voter, address receiver, uint256 timestamp);
    event RemoveVote(address voter);
    event StartVoting(address startedBy);
    event StopVoting(address stoppedBy);

    function startVoting() external returns(bool){

        isVoting = false;
        emit StopVoting(msg.sender);
        return true;
    }

    function stopVoting() external returns(bool){

        isVoting = false;
        emit StopVoting(msg.sender);
        return true;
    }

    function removeVote() external returns(bool){

        delete votes[msg.sender];
        emit RemoveVote(msg.sender);
        return true;
    }

    function getVote(address voterAddress) external view returns(address candidateAddress){

        return votes[voterAddress].receiver;
    }

}