// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";    
import "@openzeppelin/contracts/access/Ownable.sol";

// Make this contract inherit from ERC721URIStorage and Ownable
contract Assignment8 is ERC721URIStorage, Ownable {
    // Declare a private uint called _tokenIdCounter
    uint256 private _tokenIdCounter;

    // Pass name and symbol of the NFT token collection
    constructor() ERC721("BuzzBuzz", "Buz") {}

    // Mint NFT function
    function mintNFT(string memory jsonURI) external onlyOwner returns (uint256) {
        uint256 newTokenId = _tokenIdCounter;

        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, jsonURI);

        _tokenIdCounter++; // increment token id counter

        return newTokenId;
    }
}
