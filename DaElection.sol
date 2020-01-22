pragma solidity ^0.5.1;

contract Election {
    
    struct Candidate {
        string name;
        uint voteCount;
    }
    
    struct Voter {
        bool isAuthorized;
        bool hasVoted;
        uint vote;
    }
    
    address public owner;
    string public electionName;
    
    mapping(address => Voter) public voters;
    Candidate[] public candidates;
    uint public totalVotesCasted;
    
    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }
    
    constructor(string memory _name) public{
        owner = msg.sender;
        electionName = _name;
    }
    
    function addCandidate(string memory _name) ownerOnly public {
        candidates.push(Candidate(_name, 0));
    }
    
    function getNumofCandidates() public view returns(uint) {
        return candidates.length;
    }
    
    function authorize(address _person) ownerOnly public {
        voters[_person].isAuthorized = true;
    }
    
    function vote(uint _voteIndex) public {
        require(!voters[msg.sender].hasVoted);        //the voter should not have voted already
        require(voters[msg.sender].isAuthorized);    //the voter must've been already authorized by the owner of the contract
        
        voters[msg.sender].vote = _voteIndex;
        voters[msg.sender].hasVoted = true;
        
        candidates[_voteIndex].voteCount += 1;
        totalVotesCasted += 1;
    }
    
    
}
