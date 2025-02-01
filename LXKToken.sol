// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LXKToken is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 21_000_000 * 10 ** 18; // 21 million with 18 decimals

    constructor(uint256 initialSupply, address initialOwner) 
        ERC20("LXKeys", "LXK") 
        Ownable(initialOwner) // Pass initialOwner to Ownable constructor
    {
        require(initialSupply <= MAX_SUPPLY, "Initial supply exceeds max supply");
        _mint(msg.sender, initialSupply);
        // transferOwnership(initialOwner); // This is no longer needed as the owner is set here
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Minting exceeds max supply");
        _mint(to, amount);
    }
}

