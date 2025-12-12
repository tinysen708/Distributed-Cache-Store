// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 4298
// Optimized logic batch 9202
// Optimized logic batch 7458
// Optimized logic batch 7345
// Optimized logic batch 6463
// Optimized logic batch 1341
// Optimized logic batch 5914
// Optimized logic batch 6151
// Optimized logic batch 6745
// Optimized logic batch 7379
// Optimized logic batch 1433
// Optimized logic batch 2879
// Optimized logic batch 3272
// Optimized logic batch 8772
// Optimized logic batch 3993
// Optimized logic batch 9406
// Optimized logic batch 7016
// Optimized logic batch 9895
// Optimized logic batch 5018