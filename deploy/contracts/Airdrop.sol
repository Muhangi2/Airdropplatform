// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Airdrop  {

    address public  _tokenContract;
    uint256 public _airdropAmount;

     uint256 public _fee=0.005 ether;
     mapping(uint256=>airdrop)public airdrops;

     struct airdrop{
        string name;
        string twitterid;
        string linkedIurl;
        string instagramUrl;
        string email;
        uint256 timestamp;
     }

    uint256 public totalAirdrops;
    event EtherTransfer(address beneficiary,uint amount);

    constructor(address tokenContract ,uint56 airdropAmount){
        _tokenContract=tokenContract;
        _airdropAmount=airdropAmount;
    }

    function  dropTokens(string memory _name,string memory _twitter_id, string memory _linkedIurl,string memory instagramUrl,string memory email)
    public payable returns(bool)
    {
        require(msg.value>= _fee,"Not enough cash");
        require(Token(_tokenContract).balanceOf(msg.sender)<_airdropAmount);
         require(Token(_tokenContract).transfer(msg.sender)<_airdropAmount);

         uint256 airdropId=totalAirdrops++;
         airdrops[airdropId]=airdrop(airdropId,msg.sender,_name,_twitter_id,_linkedIurl,instagramUrl,email,block.timestamp);

         return true;
    }
  
    function setAirdropAmount (uint256 airdropAmount )external onlyOwner{
        _airdropAmount=airdropAmount;
    }
    function setFee(uint256 fee)external onlyOwner{
        _fee=fee;
    }
      function setTokenContract(address tokenContract) external onlyOwner {
        _tokenContract=tokenContract;
    }

function withdrawTokens(address beneficiary ,address _tokenaddress) public onlyOwner{
    require(Token(_tokenaddress).transfer(beneficiary,Token(_tokenaddress).balanceOf(address(this))));
}

function withdrawEther(address payable beneficiary)public onlyOwner {
    beneficiary.transfer(address(this).balance);
}
function contractBalance()public view returns(uint256){
    return address(this).balance;
}

  function getAllAirdrops() external view returns (airdrop[] memory){
    airdrop[] memory _airdrops=new airdrop[](totalAirdrops);
    for(uint26 i=0;i<totalAirdrops;i++){
        _airdrops[i]=airdrop[i];
    }
    return _airdrops;
  }
}
