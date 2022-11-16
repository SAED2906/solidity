pragma solidity ^0.8.13;

contract myContract{

    uint256 peopleCount = 0;
    mapping(uint => Person) public people;

    uint256 openingTime = 1668618370;

    address owner;

    modifier onlyWhileOpen(
    )
    {
        require(block.timestamp >= openingTime); // Block part of sol
        _; // Do more research
    }

    modifier onlyOwner(
    )
    {//msg - function meta data
        require(msg.sender == owner); //data implied
        _;
    }

    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor(
    ) 
    public
    {
        owner = msg.sender;
    }




    function addPerson(//Params
        string memory _firstName, 
        string memory _lastName
    ) //Motifiers
    public 
    onlyOwner
    onlyWhileOpen()
    {//Code
        //people.push(Person(_firstName, _lastName)); put in mapping not array
        CountInc();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function CountInc(
    )
    internal
    {
        peopleCount += 1;
    }




}    
