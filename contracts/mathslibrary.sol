// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library mathslibrary{
    

    function add(uint256 _first, uint256 _second) internal pure returns(uint256){
        uint256 addednumber = _first + _second;
        return addednumber;
    }
}