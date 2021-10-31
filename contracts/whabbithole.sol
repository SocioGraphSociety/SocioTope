// SPDX-License-Identifier: GPL-3.0

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                               tttt                                                                                       IIIIIIIIIIIIIIIIIIIIIIIIIIIIII        66666666          //
//                            ttt:::t                                                                                       I::::::::II::::::::II::::::::I       6::::::6           //
//                            t:::::t                                                                                       I::::::::II::::::::II::::::::I      6::::::6            //  
//                            t:::::t                                                                                       II::::::IIII::::::IIII::::::II     6::::::6             //
//         ssssssssss   ttttttt:::::ttttttt        eeeeeeeeeeee    rrrrr   rrrrrrrrr       eeeeeeeeeeee       ooooooooooo     I::::I    I::::I    I::::I      6::::::6              //
//       ss::::::::::s  t:::::::::::::::::t      ee::::::::::::ee  r::::rrr:::::::::r    ee::::::::::::ee   oo:::::::::::oo   I::::I    I::::I    I::::I     6::::::6               //
//     ss:::::::::::::s t:::::::::::::::::t     e::::::eeeee:::::eer:::::::::::::::::r  e::::::eeeee:::::eeo:::::::::::::::o  I::::I    I::::I    I::::I    6::::::6                //
//     s::::::ssss:::::stttttt:::::::tttttt    e::::::e     e:::::err::::::rrrrr::::::re::::::e     e:::::eo:::::ooooo:::::o  I::::I    I::::I    I::::I   6::::::::66666           //
//      s:::::s  ssssss       t:::::t          e:::::::eeeee::::::e r:::::r     r:::::re:::::::eeeee::::::eo::::o     o::::o  I::::I    I::::I    I::::I  6::::::::::::::66         //
//        s::::::s            t:::::t          e:::::::::::::::::e  r:::::r     rrrrrrre:::::::::::::::::e o::::o     o::::o  I::::I    I::::I    I::::I  6::::::66666:::::6        //
//           s::::::s         t:::::t          e::::::eeeeeeeeeee   r:::::r            e::::::eeeeeeeeeee  o::::o     o::::o  I::::I    I::::I    I::::I  6:::::6     6:::::6       //
//     ssssss   s:::::s       t:::::t    tttttte:::::::e            r:::::r            e:::::::e           o::::o     o::::o  I::::I    I::::I    I::::I  6:::::6     6:::::6       //
//     s:::::ssss::::::s      t::::::tttt:::::te::::::::e           r:::::r            e::::::::e          o:::::ooooo:::::oII::::::IIII::::::IIII::::::II6::::::66666::::::6       //
//     s::::::::::::::s       tt::::::::::::::t e::::::::eeeeeeee   r:::::r             e::::::::eeeeeeee  o:::::::::::::::oI::::::::II::::::::II::::::::I 66:::::::::::::66        //
//      s:::::::::::ss          tt:::::::::::tt  ee:::::::::::::e   r:::::r              ee:::::::::::::e   oo:::::::::::oo I::::::::II::::::::II::::::::I   66:::::::::66          //
//       sssssssssss              ttttttttttt      eeeeeeeeeeeeee   rrrrrrr                eeeeeeeeeeeeee     ooooooooooo   IIIIIIIIIIIIIIIIIIIIIIIIIIIIII     666666666            //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @artist ::          stereoIII6.eth                                                                                                                                          //
//      @msg ::             stereoIII6.eth.chat                                                                                                                                     //
//      @github ::          stereoIII6                                                                                                                                              //
//                                                                                                                                                                                  //
//      @dev ::             stereoIII6.eth                                                                                                                                          //
//      @msg ::             stereoIII6.eth.chat                                                                                                                                     //
//      @github ::          stereoIII6                                                                                                                                              //
//                                                                                                                                                                                  //
//      @author ::          stereoIII6.eth                                                                                                                                          //
//      @msg ::             stereoIII6.eth.chat                                                                                                                                     //
//      @github ::          stereoIII6                                                                                                                                              //
//                                                                                                                                                                                  //
//      @community ::                                                                                                                                              //
//      @msg ::                                                                                                                                                 //
//      @github ::                                                                                                                                                   //
//                                                                                                                                                                                  //
//      @product ::         robinWood.eth                                                                                                                                           //
//      @msg ::             robinWood.eth.chat                                                                                                                                      //
//      @github ::          robinWood                                                                                                                                               //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @title ::           Rite Whabbit Club                                                                                                                                       //
//      @description ::     The #1 Multiplayer Blockchain Detective Game                                                                                                            //
//      @version ::         0.0.1                                                                                                                                                   //
//      @purpose ::         Bring real life into the Blockchain                                                                                                                     //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //

pragma solidity >=0.7.0 <0.9.0;

/** 

Open Zeppelin Imports

**/

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC1155/ERC1155.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC1155/IERC1155.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC721/ERC721.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC721/IERC721.sol";

/**

// Polygon Mainnet Chainlink VRF Data //

$LINK-Token ::       0xb0897686c545045aFc77CF20eC7A532E3120E0F1
$VRF-Coordinator ::	0x3d2341ADb2D31f1c5530cDC622016af293177AE0
$Key-Hash :: 	    0xf86195cf7690c55907b2b611ebb7343a6f649bff128701cc542f0569e2c549da
$Fee	::              0.0001 LINK

// Polygon Mumbai Testnet Chainlink VRF Data //

$LINK-Token	0x326C977E6efc84E512bB9C30f76E30c160eD06FB
$VRF-Coordinator	0x8C7382F9D8f56b33781fE506E897a4F1e2d17255
$Key-Hash	0x6e75b569a01ef56d18cab6a8e71e6600d6ce853834d4a5748b720d06f878b3a4

**/

/** 

Chainlink Imports

**/

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/contracts/src/v0.8/ChainlinkClient.sol";
import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/contracts/src/v0.8/VRFConsumerBase.sol";

contract WhabbitStall is ERC1155, VRFConsumerBase {


    /* // VRF Var Mainnet Init 
    address internal LNK = 0xb0897686c545045aFc77CF20eC7A532E3120E0F1;
    address internal VRF = 0x3d2341ADb2D31f1c5530cDC622016af293177AE0;
    bytes32 internal KEY = 0xf86195cf7690c55907b2b611ebb7343a6f649bff128701cc542f0569e2c549da;
    
    // */  
    // VRF Var Mumbai Init
    address internal LNK = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;
    address internal VRF = 0x8C7382F9D8f56b33781fE506E897a4F1e2d17255;
    bytes32 internal KEY = 0x6e75b569a01ef56d18cab6a8e71e6600d6ce853834d4a5748b720d06f878b3a4;
    // */
    uint256 internal FEE = 1 * 10 ** 14;
    uint256 public randomResult;
    event RequestedRandomness(bytes32 requestId);

    

    constructor(address _admin, address _rescue, address _safe, bytes32 _hashy) VRFConsumerBase(VRF, LNK) ERC1155("Rite Whabbit Club")
    {
        admin = _admin;
        creator = msg.sender;
        rescue = _rescue;
        hashy = _hashy;
    }
    fallback() external {}
    function getRandomNumber(uint256 userProvidedSeed)
        public
        returns (bytes32 requestId)
    {
        requestId = requestRandomness(KEY, FEE);
        emit RequestedRandomness(requestId);
    }

    /**
     * Requests the address of the Chainlink Token on this network
     */
    function getChainlinkToken() public view returns (address) {
        return address(LINK);
    }

    /**
     * Callback function used by VRF Coordinator
     */
    function fulfillRandomness(
        bytes32, /* requestId */
        uint256 randomness
    ) internal override {
        randomResult = randomness;
    }

}

contract WhabbitHole is Board, Scenario {

    /*
    In order to give out admin and mod roles we need the addresses of users locked into the 
    contract the admin wallet and rescue wallet by manual entry at creating creation
    */
    
    // system address vars
    address private admin;
    address private creator;
    address public safe;
    address private mod;
    address internal rescue;
    bytes32 internal hashy;
    
    // currency address vars 
    address private pETH;
    address private pDAI;
    address private pMTC;
    mapping(address => bool) public blacklist;
    mapping(address => uint) public greylisted;
    mapping(address => mapping(uint => uint)) public greylist;
    mapping(address => bool) public whitelist;

}

contract Scenario {

}

contract Board {

}

contract Carrots is ERC155 {
    
}
