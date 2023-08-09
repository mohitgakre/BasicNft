// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {

    uint256 private s_tokenConter;
    mapping(uint256  => string) private s_tokenIdToUri;
     
     constructor() ERC721("Dogie","DOG") {
        s_tokenConter = 0;
     }

     function mintNft(string memory tokenUri)  public {
        s_tokenIdToUri[s_tokenConter] = tokenUri;
        _safeMint(msg.sender, s_tokenConter);
        s_tokenConter ++;
     }        
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
} 
    
