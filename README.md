# MyToken Smart Contract

This Solidity smart contract represents a custom ERC20 token called "DEGEN" (with symbol "DGN"). It includes functionality for minting new tokens, transferring tokens, redeeming tokens for items, checking token balances, burning tokens, and managing redemption requirements for items.

## Table of Contents

- [Contract Details](#contract-details)
- [Functionality](#functionality)
- [Usage](#usage)
- [Authors](#authors)
- [License](#license)


## Contract Details

- **Token Name:** DEGEN
- **Token Symbol:** DGN
- **Decimals:** 18 (You can update this value as needed for your token.)

## Functionality

1. **Minting New Tokens:** Only the owner can mint new tokens.

2. **Transferring Tokens:** Players can transfer their tokens to others.

3. **Redeeming Tokens for Items:** Players can redeem tokens for specific items by entering a number corresponding to an item category (BorderDesign, NFT, Accessories).

4. **Checking Token Balance:** Players can check their token balance at any time.

5. **Burning Tokens:** Anyone can burn tokens they own that are no longer needed.

6. **Setting Redemption Requirements:** The owner can add or update redemption requirements for items.

7. **Getting Redemption Requirements:** Anyone can query the redemption requirement for a specific item.

## Usage

1. Deploy the contract to your desired Ethereum network (Fuji in my case).

2. Mint new tokens using the `mint` function.

3. Players can transfer tokens to others using the `transferTokens` function.

4. Set redemption requirements for items using the `setRedemptionRequirement` function.

5. Players can redeem tokens for items using the `redeemItem` function.

6. Players can check their token balance using the `checkBalance` function.

7. Anyone can burn tokens using the `burnDGN` function.

8. Anyone can query the redemption requirement for a specific item using the `getRedemptionRequirement` function.

## Authors

Metacrafter Randel Jason B. Espiritu

## License

This contract is released under the MIT License. You can find the license information in the contract source code.

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
