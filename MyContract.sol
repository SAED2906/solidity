pragma solidity ^0.8.13;

contract myContract{

    //Sig - Significance

 string public value = "Test";
 string public constant consVariable = "const";
 bool public myBool = true;
 int public myInt = -1; //Signed int
 uint public myUInt = 1; //Unsigned
 uint8 public myUInt8 = 8; //Unsigned
 uint256 public myUInt256 = 99999; //Unsigned
 //Person[] public people; // Array that contains person structs
 mapping(uint => Person) public people;

 uint256 public peopleCount = 0;

    enum State { Waiting, Ready, Active}
    State public state;

    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        //people.push(Person(_firstName, _lastName)); put in mapping not array
        peopleCount += 1;
        people[peopleCount] = Person(_firstName, _lastName);
        
    }

    function CountInc() internal{
        peopleCount += 1;
    }

    


    constructor() public {
        state = State.Waiting;
        value = "myValue";
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns(bool){ // Learn view sig
        return state == State.Active;
    }

    function get() public view returns (string memory) { // Learn memory sig
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }

    
}
