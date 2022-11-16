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

    address owner;

    modifier onlyOwner(){//msg - function meta data
        require(msg.sender == owner); //data implied
        _;
    }

    constructor() public {
        state = State.Waiting;
        value = "myValue";
        owner = msg.sender;
    }

    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }


    function addPerson(//Params
        string memory _firstName, 
        string memory _lastName
    ) //Motifiers
    public 
    onlyOwner
    {//Code
        //people.push(Person(_firstName, _lastName)); put in mapping not array
        CountInc();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
    }

    function CountInc() internal{
        peopleCount += 1;
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
