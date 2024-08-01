// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// inheritance

import {Simple_Storage} from "./simplestorage.sol";

contract squared is Simple_Storage{

    function sayhello () public pure returns (string memory) {

        return "hello";

    }

    function store(uint256 myfavnum) public override {
        favoriteNumber = myfavnum**2;
    }
}