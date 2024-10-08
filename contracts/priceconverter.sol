// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {AggregatorV3Interface} from  "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library priceconverter{
    function getPrice () internal view returns(uint256){
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        // function to get the etherium price in USD
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = pricefeed.latestRoundData();                    
        return uint256(answer*1e10);
    }

    function getConversionrate(uint256 ethAmount) internal  view returns(uint256) {
        // function to get the conversion of eth to usd

        uint256 ethprice = getPrice();
        uint256 ethAmountInUSD = (ethAmount*ethprice)/1e18;

        return ethAmountInUSD;
    }

    // We can test the Interface usage by calling the `version()` function
    function getVersion() internal  view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getDecimals() internal  view returns (uint8){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();
    }

    function getLatestBTCPriceInETH() internal  view returns(uint256){
        AggregatorV3Interface pricefeed= AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);
        (,int256 answer,,,) = pricefeed.latestRoundData();                    
        return uint256(answer*1e10);

    }

    function convertUsdToEth(uint256 usdAmount, uint256 ethPrice) internal  pure returns(uint256){
        uint256 Ethamount = (usdAmount*1e18)/ethPrice;

        return Ethamount;
    }

}