pragma solidity ^0.8.29;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


error OwnableUnauthorizedAccount(address caller);

contract Assignment8 is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;

    constructor() ERC721("BuzzBuzz", "Buz") Ownable(msg.sender) {}

    function mintNFT(string memory jsonURI) external onlyOwner returns (uint256) {
        uint256 newTokenId = _tokenIdCounter;

        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, jsonURI);

        _tokenIdCounter++; // increment token id counter

        return newTokenId;
    }

    function enforceOnlyOwner() internal view {
        if (msg.sender != owner()) {
            revert OwnableUnauthorizedAccount(msg.sender);
        }
    }
}
  
