// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

// Fund
// Withdraw

contract FundFundMe is Script {
    address user = makeAddr("user");
    uint256 public constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentlyDeployed) public {
        vm.startPrank(user);
        vm.deal(user, 10 ether);
        FundMe(payable(mostRecentlyDeployed)).fund{value: SEND_VALUE}();
        vm.stopPrank();
        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        // use DevOpsTools to get the latest deployed contract address
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        vm.startBroadcast();
        fundFundMe(mostRecentlyDeployed);
        vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script {
    address owner;

    function withdrawFundMe(address mostRecentlyDeployed) public {
        owner = FundMe(payable(mostRecentlyDeployed)).getOwner();
        uint256 amount = mostRecentlyDeployed.balance;
        vm.startPrank(owner);
        FundMe(payable(mostRecentlyDeployed)).withdraw();
        vm.stopPrank();
        console.log("The owner withdrew %s amount successfully", amount);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        withdrawFundMe(mostRecentlyDeployed);
    }
}
