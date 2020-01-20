pragma solidity ^0.5.0;

contract MyMentee {
    
    string name;
    
    function mentee(string memory _name) public returns(string memory){
        name = _name;
        return name;
    }
    
}
