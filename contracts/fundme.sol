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

import {AggregatorV3Interface} from  "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Fundme{
    uint256 public minimumUSD =5e18;

    function fundme () public payable {
        // allow user to send $
        // minimum amt to send 5$
        // 1. how do we send eth to this contract
        
        require(getConversionrate(msg.value) > minimumUSD, "doesn't satisfy my need "); 
        // 1e18 = 1*1000000000000000000 = 1*10^18
    }
    
    function getPrice () public view returns(uint256){
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        // function to get the etherium price in USD
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = pricefeed.latestRoundData();                    
        return uint256(answer*1e10);
    }

    function getConversionrate(uint256 ethAmount) public  view returns(uint256) {
        // function to get the conversion of eth to usd

        uint256 ethprice = getPrice();
        uint256 ethAmountInUSD = (ethAmount*ethprice)/1e18;

        return ethAmountInUSD;
    }
    
    // We can test the Interface usage by calling the `version()` function
    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getDecimals() public view returns (uint8){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();
    }

    function getLatestBTCPriceInETH() public view returns(uint256){
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);
        (,int256 answer,,,) = pricefeed.latestRoundData();                    
        return uint256(answer*1e10);

    }

    function convertUsdToEth(uint256 usdAmount, uint256 ethPrice) public pure returns(uint256){
        uint256 Ethamount = (usdAmount*1e18)/ethPrice;

        return Ethamount;
    }

}