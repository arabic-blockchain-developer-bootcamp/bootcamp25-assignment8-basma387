// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Assignment8} from "../src/Assignment8.sol";

contract Assignment8Test is Test {
    Assignment8 assignment;
    string public temporaryUriForTesting = "https://azure-yearning-shrew-339.mypinata.cloud/ipfs/bafkreifo3hg2hnig5ojay3tonmf6un3qlxqjienffsmpkq5cfpept2fake";

    function setUp() public {
        // Deploy the Assignment8 contract
        assignment = new Assignment8();
    }

    function testMintNFTByOwner() public {
        // Mint an NFT to the test contract (which is the owner)
        uint256 tokenId = assignment.mintNFT(temporaryUriForTesting);

        // Check ownership of the minted NFT (tokenId = 0 expected)
        address owner = assignment.ownerOf(tokenId);
        assertEq(owner, address(this), "Owner of token ID 0 should be the test contract");
    }

   function testMintNFTByNonOwner() public {
    // Create a fake address that is not the contract owner
    address nonOwner = makeAddr("nonOwner");

    // Start impersonating nonOwner
    vm.prank(nonOwner);

    // Expect revert due to onlyOwner restriction
    vm.expectRevert(abi.encodeWithSelector(OwnableUnauthorizedAccount.selector, nonOwner));
    assignment.mintNFT(temporaryUriForTesting);
}
    
}
