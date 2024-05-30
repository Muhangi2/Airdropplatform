// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
interface  ERC20Basic {
function totalSupply() external view returns (uint256);
function balanceOf(address who )external view returns (uint256);
function transfer(address to ,uint256 value)external returns(bool);
event Transfer(address indexed from ,address indexed to,uint256 value);
}

library SafeMath{
    function mul(uint256 a,uint256 b) internal pure returns (uint256){
        if(a=0){
            
        }
    }
}
