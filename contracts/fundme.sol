// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//get funds from users
// withdraw funds
// set minimum funding value in USD

contract Fundme{

    function fundme () public payable {
        // allow user to send $
        // minimum amt to send $
        // 1. how do we send eth to this contract
        require(msg.value >= 1e18, "doesn't satisfy my need "); 
        // 1e18 = 1*1000000000000000000 = 1*10^18
    }

}