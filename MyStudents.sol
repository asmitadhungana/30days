pragma solidity ^0.5.1;

contract MyStudents {
    struct Student {
        uint roll;
        string firstName;
        string lastName;
        uint marks;
    }
    
    address owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    mapping (uint => Student) public students;
    
    uint public stdCount;
    
    function addPerson(string memory _firstName, string memory _lastName, uint _marks) public onlyOwner {
        incrementCount();
        students[stdCount] = Student(stdCount, _firstName, _lastName, _marks); 
    } 
    
    function incrementCount() internal {
        stdCount += 1;
    }
    
    function getMarks(uint _roll) public view returns (uint) {
        return students[_roll].marks;
    }
}
