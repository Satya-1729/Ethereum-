// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Array{
    uint256 myfavoritenumber;

    struct person{
        uint256 favoritenumber;
        string name;
    }
    
    /*uint256[] listOfpeople : this is an dynamic array and if we want to convert it into 
    static we need to put some number into those square bracket*/

      
    // person public pat = person(7,"pat");
    // person public mathew = person(9,"mathew");
    // person public jon = person(11,"jon");

    person[] public listofpeople ; //[]

    function addperson(string memory _name, uint256 _favoritenumber) public {
        listofpeople.push(person(_favoritenumber,_name));
    }
}