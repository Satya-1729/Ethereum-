// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// instead of copying this code we can import the code

/*import "./simplestorage.sol"; // we willn not use this in case there is more contracts 
there so they will also get executed that will make it expensive*/

import {Simple_Storage,SimpleStorage2} from "./simplestorage.sol";


contract storagefactory{
    // uint256 public favoritenumber;
    // visiblity type public

    Simple_Storage public mysimplestorage;
    function createsimplestoragecontract() public{
        mysimplestorage = new Simple_Storage();

    }
    
}