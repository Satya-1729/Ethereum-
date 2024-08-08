// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//get funds from users
// withdraw funds
// set minimum funding value in USD

// interface AggregatorV3Interface {
//   function decimals() external view returns (uint8);

//   function description() external view returns (string memory);

//   function version() external view returns (uint256);

//   function getRoundData(
//     uint80 _roundId
//   ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

//   function latestRoundData()
//     external
//     view
//     returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
// }
// instead of all this we can just import it

import {priceconverter} from  "./priceconverter.sol";
import "./mathslibrary.sol";

contract Fundme{
    using mathslibrary for uint256;

    using priceconverter for uint256;

    uint256 public constant MINIMUM_USD =5e18;

    address[] public funder;

    address public immutable i_owner;

    uint256 public executeAfter;

    error notowner();

    constructor() {
        i_owner = msg.sender;
    }

    mapping (address funder => uint256 amountfunded ) public addresstoAmountfunded;

    function fundme () public  payable timerestricted {
        // allow user to send $
        // minimum amt to send 5$
        // 1. how do we send eth to this contract
        
        require(msg.value.getConversionrate() > MINIMUM_USD, "doesn't satisfy my need "); 
        funder.push(msg.sender);
        addresstoAmountfunded[msg.sender] = addresstoAmountfunded[msg.sender] + msg.value;
        // 1e18 = 1*1000000000000000000 = 1*10^18
    }
    
    function contributionCount() public view returns(uint256){
        return funder.length;
    }

    function calculatesum() public  view timerestricted returns (uint256)  {
        uint256 a = 27;
        uint256 b = 13;
        uint256 sum = a.add(b);
        return sum;

    }

    function withdraw() public onlyowner timerestricted{
        // require(msg.sender == i_owner, "send the i_owner"); instead of this we will use the modifier
        for(uint256 funderIndex = 0; funderIndex<funder.length; funderIndex++){
            address funders = funder[funderIndex];
            addresstoAmountfunded[funders]=0;
        }

        // resetting the array
        funder = new address[](0);

        // actually now we withdraw the funds from this contract

        // // transfer
        // payable (msg.sender).transfer(address(this).balance); // here "this" refers to this contract; 

        // // send 
        // bool success = payable (msg.sender).send(address(this).balance);
        // require(success,"transcation failed ");

        // call
        (bool truimph,) = payable (msg.sender).call{value:address(this).balance}(" ");
        require (truimph,"failed call");


    }

    modifier onlyowner() {
        // require(msg.sender == i_owner,"please send the owner");
        if(msg.sender != i_owner){
            revert notowner(); 
         }
        _;

    }

    modifier timerestricted(){
        require(block.timestamp>executeAfter,"please wait for time completion");
        _;
    }

    function setExecutionTime(uint256 _timeInSeconds) public onlyowner {
        executeAfter = block.timestamp + _timeInSeconds;
    }
}