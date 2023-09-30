// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("DEGEN", "DGN") {}

    // Mapping to store the redemption requirements for each item.
    mapping(string => uint256) public redemptionRequirements;

    // Mapping to store ownership of items.
    mapping(string => address) public itemOwners;

    // Item categories
    enum ItemCategory { BorderDesign, NFT, Accessories }

    // 1. Minting new tokens: Only the owner can mint tokens.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // 2. Transferring tokens: Players can transfer their tokens to others.
    function transferTokens(address to, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "You don't have enough tokens");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }

    // 3. Redeeming tokens for items: Players can redeem tokens for specific items by entering a number.
    function redeemItem(uint256 itemCategory) external {
        string memory item;
        if (itemCategory == uint256(ItemCategory.BorderDesign)) {
            item = "Border Design";
        } else if (itemCategory == uint256(ItemCategory.NFT)) {
            item = "NFT";
        } else if (itemCategory == uint256(ItemCategory.Accessories)) {
            item = "Accessories";
        } else {
            revert("Invalid item category");
        }

        uint256 requiredTokens = redemptionRequirements[item];
        require(requiredTokens > 0, "Redemption requirement not set for this item");

        require(balanceOf(msg.sender) >= requiredTokens, "Insufficient tokens to redeem");

        // Transfer the item to the player.
        itemOwners[item] = msg.sender;

        // Deduct the required tokens from the player's balance.
        _transfer(msg.sender, address(this), requiredTokens);
    }

    // 4. Checking token balance: Players can check their token balance at any time.
    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // 5. Burning tokens: Anyone can burn tokens they own, that are no longer needed.
    function burnDGN(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "You don't have enough tokens");
        approve(msg.sender, amount);
        _burn(msg.sender, amount);
    }

    // Add or update redemption requirements for items.
    function setRedemptionRequirement(string memory item, uint256 requiredTokens) external onlyOwner {
        redemptionRequirements[item] = requiredTokens;
    }

    // Get the redemption requirement for a specific item.
    function getRedemptionRequirement(string memory item) external view returns (uint256) {
        return redemptionRequirements[item];
    }

    function decimals() override public pure returns (uint8) {
        return 18; // Update with the appropriate number of decimals for your token.
    }
}
