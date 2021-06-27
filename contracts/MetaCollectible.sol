// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./ERC1155Tradable.sol";

contract MetaCollectible is ERC1155Tradable {
    constructor() ERC1155Tradable("MetaCollectible", "MCB") public {
        _setBaseMetadataURI("http://example.com");
    }

    function contractURI() public view returns (string memory) {
        return "http://example.com";
    }
}
