// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Mapping{
    uint256 myfavoritenumber;

    struct person{
        uint256 favoritenumber;
        string name;
    }

    mapping(uint256 => string) public favoritenumbertoname;
    


    person[] public listofpeople ; //[]

    function addperson(string memory _name, uint256 _favoritenumber) public {
        listofpeople.push(person(_favoritenumber,_name));
        favoritenumbertoname[_favoritenumber] = _name;
    
    }

    function getarraylength() public view returns(uint256){
        return listofpeople.length;
    }
}