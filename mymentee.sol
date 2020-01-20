pragma solidity ^0.4.21;

contract MyMentee {
    
    string name;
    
    function mentee(string _name) public {
        name = _name;
        return name;
    }
    
