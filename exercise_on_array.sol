// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/*Create a smart contract that can store and view a list of animals. Add manually
three (3) animals and give the possibility to the user to manually add an 
indefinite number of animals into the smart contract.*/


contract Animal{
    // string[3] public listofmyanimals ;

    string[] public listofanimals =  ["cat","cow","zebra"];
    
    function addAnimal(string memory _Animal) public {
        listofanimals.push(_Animal);
        
     }

    function retrieve () public view returns(string[] memory) {
        return listofanimals;
    }
}