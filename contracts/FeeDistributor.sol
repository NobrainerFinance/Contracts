// Brain Fee Distributor
// https://nobrainer.finance/
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract FeeDistributor {
  using SafeMath for uint256;
  address public brainAddress = 0xEA3cB156745a8d281A5fC174186C976F2dD04c2E;

  constructor(address _brain, address _farm, address _art) public {
    brainAddress = _brain;
    farmAddress = _farm;
    artistFundAddress = _art;
  }

  // Fees ratio out of 10,000. Ratio must add up to 10,000

  address public burnAddress = address(1);
  uint256 public burnRatio = 1250;

  address public devAddress1 = 0x08d19746Ee0c0833FC5EAF98181eB91DAEEb9abB;
  uint256 public devRatio1 = 500;
  
  address public devAddress2 = 0xB03832FE8f62b27F5e278F0eEe65b5Ace875D984;
  uint256 public devRatio2 = 500;

  address public artistFundAddress;
  uint256 public artistFundRatio = 250;

  address public farmAddress;
  uint256 public farmRatio = 7500;

  function pendingFarmAmount() public view returns (uint256) {
    uint256 balance = IERC20(brainAddress).balanceOf(address(this));
    if (balance > 0) {
      uint256 fraction = balance.div(10000);
      if (fraction > 0) {
        return fraction.mul(farmRatio);
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  function processTransfer() public {
    uint256 balance = IERC20(brainAddress).balanceOf(address(this));
    if (balance > 0) {
      uint256 fraction = balance.div(10000);
      if (fraction > 0) {
        IERC20(brainAddress).transfer(burnAddress, fraction.mul(burnRatio));
        IERC20(brainAddress).transfer(artistFundAddress, fraction.mul(artistFundRatio));
        IERC20(brainAddress).transfer(devAddress1, fraction.mul(devRatio1));
        IERC20(brainAddress).transfer(devAddress2, fraction.mul(devRatio2));
        IERC20(brainAddress).transfer(farmAddress, fraction.mul(farmRatio));
      }
    }
  }
}


