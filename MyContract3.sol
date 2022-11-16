pragma solidity ^0.8.13;

contract myContract{
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchase(
        address indexed _buyer, // Indexed used for outside to listen for specific _buyer
        uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function fallback() external payable{// Research external
        buyToken();
    }

    function buyToken() public payable{ // Will accept ether using payable modifier
        // Buy token
        balances[msg.sender] += 1;
        // Send ether to wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1); // can allow external program to know when function is finished calling
    }

    

}
