// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

// The ERC-20 standard defines a set of rules that developers 
// can follow to create their own tokens on the Ethereum Blockchain.


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract demoMyToken is ERC20 
{
    address owner;
    string nameOfCoin = "TriptCoin";
    string symbolOfCoin = "TRP";
    uint256 supplyTotal = 0;

    modifier allowOnlyOwner() {
        require(msg.sender == owner, "This action can only be performed by the Owner.");
        _;
    }

    function decimals() public view virtual override returns (uint8) {
        return 2;
    }

    constructor(uint _startingSupply) ERC20(nameOfCoin, symbolOfCoin)
    {
        owner = msg.sender;
        _mint(owner, _startingSupply );
        supplyTotal += _startingSupply;
    }

    function balance() public view returns (uint256)
    {
        return balanceOf(msg.sender);
    }

    function mint(address _toWallet, uint _numberOfTokens) allowOnlyOwner public 
    {
        _mint(_toWallet, _numberOfTokens);
        supplyTotal += _numberOfTokens;
    }

    function burn(uint _howMany) public 
    {
        _burn(msg.sender, _howMany);
        supplyTotal -= _howMany;
    }

    function sendTo(address _toAccount, uint _howMany) public
    {
        _transfer(msg.sender, _toAccount, _howMany);
    }
}