// SPDX-License-Identifier: MIT
pragma solidity ^0.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./MetaCollectible.sol";
import "./MetaFactory.sol";
import "./ILootBox.sol";

contract MetaLootBox is ILootBox, Ownable, ReentrancyGuard, MetaFactory {
    using SafeMath for uint256;

    event LootBoxOpened(uint256 indexed optionId, address indexed buyer, uint256 boxesPurchased, uint256 itemsMinted);
    event Warning(string message, address account);

    enum Class {
        Common,
        Rare,
        Epic,
        Legendary,
        Divine,
        Hidden
    }
    uint256 constant NUM_CLASSES = 6;

    struct OptionSettings {
        uint256 maxQuantityPerOpen;
        uint16[NUM_CLASSES] classProbabilities;
        bool hasGuaranteedClasses;
        uint16[NUM_CLASSES] guarantees;
    }
    mapping (uint256 => OptionSettings) public optionToSettings;
    mapping (uint256 => uint256[]) public classToTokenIds;
    mapping (uint256 => bool) public classIsPeminted;
    uint256 seed;
    uint256 constant INVERSE_BASIS_POINT = 10000;

    
}