// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*1.Create a function `convertUsdToEth(uint256 usdAmount, uint256 ethPrice) public returns(uint256)`, that 
converts a given amount of USD to its equivalent value in ETH.*/

import {AggregatorV3Interface} from  "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Fundme{
    uint256 public minimumETH =1e18;
    uint256[] public pushthenumber;
    address [] public firstone;

    uint256 public executeAfter;

    function fundme () public payable {
        // allow user to send $
        // minimum amt to send 5$
        // 1. how do we send eth to this contract
        
        require(getConversionrate(msg.value)/1e10 > minimumETH, "doesn't satisfy my need "); 
        // 1e18 = 1*1000000000000000000 = 1*10^18
    }

    function getPrice () public view returns(uint256){
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        // function to get the USD price in  etherium
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = pricefeed.latestRoundData();                    
        return uint256(answer*1e10);
    }

    function getConversionrate(uint256 USDAmount) public view returns(uint256){


    }
    function getDecimals() public view returns (uint8){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();
    }

    function withdrawonlyfirstaccountremix() public view{
        require(msg.sender == firstone[0],"only first sender can withdraw their funds");

    }

    function getLatestBTCPriceInETH() public view returns(uint256){
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);
        (,int256 answer,,,) = pricefeed.latestRoundData();                    
        return uint256(answer);


    }

      function addingtoarray() public timerestricted  {
        for(uint256 number=0; number<10; number++){
            pushthenumber.push(number);
        }
    }

      function retrieve() public view returns (uint256[] memory){
        return pushthenumber;
    }

    /*implement a modifier named `onlyAfter(uint256 _time)` that ensures 
    a function can only be executed after a specified time.*/

     // Function to set the time after which execution is allowed
    function setExecutionTime(uint256 _timeInSeconds) public {
        executeAfter= block.timestamp + _timeInSeconds;
    }

    // Function that can only be executed after the specified time
    function timeRestrictedFunction() public view returns (string memory) {
        require(block.timestamp >= executeAfter, "Function cannot be executed yet. Please wait.");
        // Your logic here
        return "Function executed successfully!";
    }

     modifier timerestricted(){
        require(block.timestamp>executeAfter,"please wait for time completion");
        _;
    }



}
