// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ARDataMinter is ERC20, Ownable {
    uint256 public constant MINT_PRICE = 0.005 ether; // about 12 usd as of sept 20, 2024
    uint256 public constant TOKENS_PER_MINT = 100 * 10**18; // user receives 100 tokens per 12 usd

    constructor() ERC20("ARDataToken", "ARDT") Ownable(msg.sender) {
      _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function mint() public payable {
        require(msg.value >= MINT_PRICE, "Insufficient payment");
        _mint(msg.sender, TOKENS_PER_MINT);
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);
    }
}
