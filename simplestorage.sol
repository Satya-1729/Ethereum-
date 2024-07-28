
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Simple_Storage{
    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber=_favoriteNumber;
    }

    // view pure
    function retrieve() public view returns (uint256){
        return favoriteNumber;

    }
}
