// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract InteractionsTest is Test {
    FundMe fundMe;
    address user = makeAddr("user");
    uint256 public constant SEND_VALUE = 0.01 ether;
    uint256 public constant STARTING_BALANCE = 10 ether;
    uint256 public constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        fundMe = deploy.run();
        vm.deal(user, STARTING_BALANCE);
    }

    function testUserCanFundWithInteractionsMethod() public {
        FundFundMe fundFundMe = new FundFundMe();
        vm.startPrank(user);
        fundFundMe.fundFundMe(address(fundMe));
        vm.stopPrank();

        address funder = fundMe.getFunder(0);
        assertEq(funder, user);
    }

    function testOwnerCanWithdrawWithInteractionsMethod() public {
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));

        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        uint256 fundMeBalanceBefore = address(fundMe).balance;
        uint256 ownerBalanceBefore = fundMe.getOwner().balance;
        withdrawFundMe.withdrawFundMe(address(fundMe));
        uint256 ownerBalanceAfter = fundMe.getOwner().balance;

        assert(address(fundMe).balance == 0);
        assertEq(ownerBalanceAfter - ownerBalanceBefore, fundMeBalanceBefore);
    }
}
