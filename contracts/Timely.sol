// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import '@openzeppelin/contracts/utils/Strings.sol';

// TotalSupply: 15000
// Name: TIMELY
// Symbol: TYME
// PaymentType: MATIC
// StartPrice: 5 MATIC
// How many WL: 0
// How many reserved: 0

import './abstracts/Controlable.sol';
import './abstracts/Mintable.sol';

contract Timely is Controlable, Mintable {
  using Strings for uint256;

  constructor(string memory name_, string memory symbol_, uint256 maxSupply_) Mintable(name_, symbol_, maxSupply_) {}

  modifier ownerOrMintStarted() {
    require(owner() == _msgSender() || isStarted(), 'TimelyNft: caller is not the owner or mint not started');
    _;
  }

  function mint(uint8 quantity) external payable ownerOrMintStarted {
    require(quantity > 0, 'Timelynft: quantity must be greater than 0');
    require(msg.value >= 5 matic * quantity, 'SimpleNft: Transaction value below mint price');
    _mintPublic(_msgSender(), quantity);
  }

  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    require(_exists(tokenId), 'SimpleNft: URI query for nonexistent token');
    string memory baseURI_ = baseURI();
    return bytes(baseURI_).length != 0 ? string(abi.encodePacked(baseURI_, tokenId, _extensionURI())) : '';
  }
}