// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AlmadenNFT is ERC721URIStorage, Ownable {
  uint256 public tokenCounter;
  uint256 public mintPrice = 200000000000000; // 0.0002 eth

  struct TokenAttributes {
    string tokenName;
  }

  mapping(uint256 => TokenAttributes) public tokenAttributes;
  mapping(address => uint256[]) private ownedTokens;

  constructor() ERC721("AlmadenNFT", "ALMAT") Ownable(msg.sender)  {}

  function mintToken(string memory tokenName) public payable {
    require(msg.value >= mintPrice, "Insufficient funds to mint token");

    uint256 newTokenId = tokenCounter;
    _safeMint(msg.sender, newTokenId);

    tokenAttributes[newTokenId] = TokenAttributes(tokenName);
    ownedTokens[msg.sender].push(newTokenId);
    tokenCounter++;
  }

  function withdraw() public onlyOwner {
    payable(owner()).transfer(address(this).balance);
  }

  function setMintPrice(uint256 newPrice) public onlyOwner {
    mintPrice = newPrice;
  }

  function getTokenName(uint256 tokenId) public view returns (string memory) {
    require(ownerOf(tokenId) != address(0), "Token does not exist");
    return tokenAttributes[tokenId].tokenName;
  }

  function tokensOfOwner(address owner) public view returns (uint256[] memory) {
    return ownedTokens[owner];
  }
}
