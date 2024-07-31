// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// instead of copying this code we can import the code

/*import "./simplestorage.sol"; // we willn not use this in case there is more contracts 
there so they will also get executed that will make it expensive*/

import {Simple_Storage,SimpleStorage2} from "./simplestorage.sol";


contract storagefactory{
    // uint256 public favoritenumber;
    // visiblity type public

    // Simple_Storage public mysimplestorage; its been overidden the simplestorage contract variable
    Simple_Storage[] public listofmysimplestoragecontracts;

    function createsimplestoragecontract() public{
        Simple_Storage newsimplestoragecontract = new Simple_Storage();
        listofmysimplestoragecontracts.push(newsimplestoragecontract);
    

    }

    function sfstore(uint256 _simplestorageindex, uint256 _simplestoragenumber) public{
        //address
        //ABI
        // Simple_Storage mysimplestorage = listofmysimplestoragecontracts[_simplestorageindex];
        listofmysimplestoragecontracts[_simplestorageindex].store(_simplestoragenumber);

    }

    function sfget(uint256 _simplestorageindex) public view returns(uint256){
        // Simple_Storage mysimplestorage = listofmysimplestoragecontracts[_simplestorageindex];
        return listofmysimplestoragecontracts[_simplestorageindex].retrieve();

    }
    
}