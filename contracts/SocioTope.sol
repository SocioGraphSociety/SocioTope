// SPDX-License-Identifier: GPL-3.0

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//       ___      ___      ___     ( )  ___    __  ___  ___      ___      ___
//    ((   ) ) //   ) ) //   ) ) / / //   ) )  / /   //   ) ) //   ) ) //___) )
//    \ \    //   / / //       / / //   / /  / /   //   / / //___/ / //
// //_ ) ) ((___/ / ((____   / / ((___/ /  / /   ((___/ / //       ((____
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
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @title ::           SocioTope                                                                                                                                             //
//      @description ::     Decentral Social Network Experiment                                                                                                                     //
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
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC1155/IERC1155.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/IERC20.sol";

contract SocioTope {
    address payable admin;

    // currency address vars
    address private pETH;
    address private pDAI;
    IERC20 public polyETH = IERC20(pETH);
    IERC20 public polyDAI = IERC20(pDAI);
    uint256 public digits;

    // admin lists mappings
    mapping(address => bool) public blacklist;
    mapping(address => uint256) public greylisted;
    mapping(address => mapping(uint256 => uint256)) public greylist;
    mapping(address => bool) public whitelist;
    mapping(address => mapping(address => bool)) public following;
    mapping(address => mapping(address => bool)) public followers;
    mapping(address => mapping(address => mapping(uint256 => string)))
        public message;
    mapping(address => uint256) public msgRec;
    mapping(address => uint256) public msgSent;

    struct User {
        uint256 id;
        uint256 cnt;
        uint256 role; // 0 inactive, 1 noob, 2 profiler, 99 admin
        address adr;
        string name;
        string email;
        uint256 likes;
    }
    struct Profile {
        uint256 cnt;
        address adr;
        string avt;
        string cols;
        string fonts;
        uint256 layout;
    }

    uint256 internal u;
    User[] public users;
    Profile[] public profiles;
    mapping(address => uint256) internal userNum;
    mapping(address => uint256) public userCountByAdr;

    struct Socio {
        uint256 id;
        address author;
        bool master;
        bool pin;
        uint256 copys;
        address[] ownedBy;
        string title;
        string content;
        address[] likedBy;
        uint256 likes;
    }
    struct Comment {
        uint256 id;
        uint256 sid;
        address author;
        string title;
        string content;
        address[] likedBy;
        uint256 likes;
    }

    uint256 internal s;
    Socio[] public socios;
    mapping(address => uint256) internal SocioCountOf;
    mapping(address => mapping(uint256 => uint256)) public SocioCountOfAdrById;
    mapping(address => mapping(uint256 => Socio)) public SocioIdOfAdrByCount;
    mapping(uint256 => bool) public socioID;
    mapping(uint256 => bool) public commentID;

    uint256 internal c;
    Comment[] public comments;
    mapping(address => uint256) internal CommentCountOf;
    mapping(address => mapping(uint256 => uint256))
        public CommentCountOfAdrById;
    mapping(address => mapping(uint256 => Comment))
        public CommentIdOfAdrByCount;

    constructor(address payable _admin) {
        admin = _admin;
        u = 0;
        users.push(
            User({
                id: 99999999,
                cnt: u,
                role: 99,
                adr: admin,
                name: "stereo",
                email: "type.stereo@pm.me",
                likes: 10
            })
        );
        makeProfile(admin, "https://ipfs.io/ipfs/#", "light", "geo", 3);
        whitelist[admin] = true;
        userNum[admin] = u;
        u = u + 1;
    }

    function makeUser(
        uint256 _id,
        uint256 _cnt,
        address _adr,
        string memory _name,
        string memory _email
    ) public returns (bool) {
        users.push(
            User({
                id: _id,
                cnt: _cnt,
                role: 1,
                adr: _adr,
                name: _name,
                email: _email,
                likes: 10
            })
        );
        return true;
    }

    function makeProfile(
        address _adr,
        string memory _avt,
        string memory _cols,
        string memory _fonts,
        uint256 _layout
    ) public returns (bool) {
        profiles.push(
            Profile({
                cnt: userNum[_adr],
                adr: _adr,
                avt: _avt,
                cols: _cols,
                fonts: _fonts,
                layout: _layout
            })
        );
        User storage user = users[userNum[_adr]];
        user.role = 2;
        user.likes = user.likes + 10;
        users[userNum[_adr]] = user;
        return true;
    }

    function createSocio(
        uint256 _id,
        bool _master,
        bool _pin,
        uint256 _copys,
        string memory _title,
        string memory _content
    ) public returns (bool) {
        User storage user = users[userNum[msg.sender]];
        require(socioID[_id] != true);
        require(user.role >= 2);

        socios.push(
            Socio({
                id: _id,
                author: msg.sender,
                master: _master,
                pin: _pin,
                copys: _copys,
                ownedBy: new address[](0),
                title: _title,
                content: _content,
                likedBy: new address[](0),
                likes: 0
            })
        );

        user.likes = user.likes + 2;
        SocioCountOfAdrById[msg.sender][_id] = s;
        SocioIdOfAdrByCount[msg.sender][SocioCountOf[msg.sender]] = socios[s];
        SocioCountOf[msg.sender] = SocioCountOf[msg.sender] + 1;
        if (SocioCountOf[msg.sender] % 9 == 0) user.likes = user.likes + 1;
        if (SocioCountOf[msg.sender] % 99 == 0) user.likes = user.likes + 10;
        if (SocioCountOf[msg.sender] % 999 == 0) user.likes = user.likes + 100;
        users[userNum[msg.sender]] = user;
        socioID[_id] = true;
        s = s + 1;
        return true;
    }

    function createComment(
        uint256 _id,
        uint256 _sid,
        string memory _title,
        string memory _content
    ) public returns (bool) {
        User storage user = users[userNum[msg.sender]];
        require(commentID[_id] != true);
        require(socioID[_sid] == true);
        comments.push(
            Comment({
                id: _id,
                sid: _sid,
                author: msg.sender,
                title: _title,
                content: _content,
                likedBy: new address[](0),
                likes: 0
            })
        );
        user.likes = user.likes + 1;
        CommentCountOfAdrById[msg.sender][_id] = c;
        CommentIdOfAdrByCount[msg.sender][
            CommentCountOf[msg.sender]
        ] = comments[c];
        CommentCountOf[msg.sender] = CommentCountOf[msg.sender] + 1;
        users[userNum[msg.sender]] = user;
        commentID[_id] = true;
        c = c + 1;
        return true;
    }

    function editSocio(
        uint256 _id,
        string memory _title,
        string memory _content
    ) public returns (bool) {
        require(socioID[_id] == true);
        uint256 sc = SocioCountOfAdrById[msg.sender][_id];
        Socio storage socio = socios[sc];
        socio.title = _title;
        socio.content = _content;
        socios[sc] = socio;
        return true;
    }

    function editComment(
        uint256 _id,
        string memory _title,
        string memory _content
    ) public returns (bool) {
        require(commentID[_id] == true);
        uint256 cc = CommentCountOfAdrById[msg.sender][_id];
        Comment storage comment = comments[cc];
        comment.title = _title;
        comment.content = _content;
        comments[cc] = comment;
        return true;
    }

    function delSocio(uint256 _id) public returns (bool) {
        require(socioID[_id] == true);
        uint256 sc = SocioCountOfAdrById[msg.sender][_id];
        Socio storage socio = socios[sc];
        socio.title = "";
        socio.content = "";
        socios[sc] = socio;
        return true;
    }

    function delComment(uint256 _id) public returns (bool) {
        require(commentID[_id] == true);
        uint256 cc = CommentCountOfAdrById[msg.sender][_id];
        Comment storage comment = comments[cc];
        comment.title = "";
        comment.content = "";
        comments[cc] = comment;
        return true;
    }

    function likeSocio(uint256 _id) public returns (bool) {
        User storage user = users[userNum[msg.sender]];
        uint256 sc = SocioCountOfAdrById[msg.sender][_id];
        Socio storage socio = socios[sc];
        require(socioID[_id] == true);
        require(user.role >= 2);
        address[] storage likedArr = socio.likedBy;
        likedArr.push(msg.sender);
        socio.likedBy = likedArr;
        socios[sc] = socio;
        user.likes = user.likes - 1;
        users[userNum[msg.sender]] = user;
        return true;
    }

    function likeComment(uint256 _id) public returns (bool) {
        User storage user = users[userNum[msg.sender]];
        uint256 sc = CommentCountOfAdrById[msg.sender][_id];
        Comment storage comment = comments[sc];
        require(commentID[_id] == true);
        require(user.role >= 2);
        address[] storage likedArr = comment.likedBy;
        likedArr.push(msg.sender);
        comment.likedBy = likedArr;
        comments[sc] = comment;
        user.likes = user.likes - 1;
        users[userNum[msg.sender]] = user;
        return true;
    }

    function showSocio(uint256 _id) public view returns (Socio memory) {
        uint256 sc = SocioCountOfAdrById[msg.sender][_id];
        return socios[sc];
    }

    function showComment(uint256 _id) public view returns (Comment memory) {
        uint256 cc = CommentCountOfAdrById[msg.sender][_id];
        return comments[cc];
    }

    function myGraph() public view returns (User memory, Profile memory) {
        User memory you = users[userNum[msg.sender]];
        Profile memory pro = profiles[userNum[msg.sender]];
        return (you, pro);
    }

    function lastPosts()
        public
        view
        returns (
            Socio memory,
            Socio memory,
            Socio memory
        )
    {
        uint256 uc = SocioCountOf[msg.sender];
        require(uc >= 3, "not enough posts");
        return (socios[uc - 1], socios[uc - 2], socios[uc - 3]);
    }

    function lastComments()
        public
        view
        returns (
            Comment memory,
            Comment memory,
            Comment memory
        )
    {
        uint256 uc = CommentCountOf[msg.sender];
        require(uc >= 3, "not enough comments");
        return (comments[uc - 1], comments[uc - 2], comments[uc - 3]);
    }

    function follow(address _follow) public returns (bool) {
        following[msg.sender][_follow] = true;
        followers[_follow][msg.sender] = true;
        return true;
    }

    function unfollow(address _follow) public returns (bool) {
        following[msg.sender][_follow] = false;
        followers[_follow][msg.sender] = false;
        return true;
    }

    function writeMessage(address _to, string memory _msg)
        public
        returns (bool)
    {
        message[msg.sender][_to][msgRec[_to]] = _msg;
        msgRec[_to] = msgRec[_to] + 1;
        msgSent[msg.sender] = msgSent[msg.sender] + 1;
        return (true);
    }

    function readMessage(address _from) public view returns (string memory) {
        return message[_from][msg.sender][msgRec[msg.sender]];
    }

    /** STANDARD CONTRACT FUNCTIONALITY **/

    // Fallback function
    fallback() external {}

    /* **/
    // Withdraw Common ERC20
    function withdraw(
        uint256 _amountMAT,
        uint256 _amountETH,
        uint256 _amountDAI,
        address _adr
    ) public payable returns (bool) {
        require(whitelist[_adr] == true);
        require(admin == msg.sender);
        require(polyETH.balanceOf(address(this)) >= _amountETH * digits);
        polyETH.transfer(admin, _amountETH);
        require(polyDAI.balanceOf(address(this)) >= _amountDAI * digits);
        polyDAI.transfer(admin, _amountDAI);
        require(address(this).balance >= _amountMAT * digits + 1 * 10**14);
        admin.transfer(_amountMAT);
        return true;
    }

    // Withdraw Unknown Crypto ERC20
    function withdrawUCO(address _erc) public payable returns (bool) {
        IERC20 UCO = IERC20(_erc);
        require(UCO.balanceOf(address(this)) >= 0);
        UCO.transfer(admin, UCO.balanceOf(address(this)));
        return true;
    }
}
wagmi
interface ISocioTope {
    //address payable admin;
    function admin() external view returns (address);

    // currency address vars
    //address private pETH;
    function pETH() external view returns (address);

    //address private pDAI;
    function pDAI() external view returns (address);

    //IERC20 public polyETH = IERC20(pETH);
    function polyETH() external view returns (IERC20);

    //IERC20 public polyDAI = IERC20(pDAI);
    function polyETH() external view returns (IERC20);

    uint256 public digits;

    function digits() external view returns (uint256);

    // admin lists mappings
    // mapping(address => bool) public blacklist;
    function blacklist(address _adr) external view returns(bool);
    mapping(address => uint256) public greylisted;
    function greylist
    mapping(address => mapping(uint256 => uint256)) public greylist;
    mapping(address => bool) public whitelist;
    mapping(address => mapping(address => bool)) public following;
    mapping(address => mapping(address => bool)) public followers;
    mapping(address => mapping(address => mapping(uint256 => string)))
        public message;
    mapping(address => uint256) public msgRec;
    mapping(address => uint256) public msgSent;

    struct User {
        uint256 id;
        uint256 cnt;
        uint256 role; // 0 inactive, 1 noob, 2 profiler, 99 admin
        address adr;
        string name;
        string email;
        uint256 likes;
    }
    struct Profile {
        uint256 cnt;
        address adr;
        string avt;
        string cols;
        string fonts;
        uint256 layout;
    }

    uint256 internal u;
    User[] public users;
    Profile[] public profiles;
    mapping(address => uint256) internal userNum;
    mapping(address => uint256) public userCountByAdr;

    struct Socio {
        uint256 id;
        address author;
        bool master;
        bool pin;
        uint256 copys;
        address[] ownedBy;
        string title;
        string content;
        address[] likedBy;
        uint256 likes;
    }
    struct Comment {
        uint256 id;
        uint256 sid;
        address author;
        string title;
        string content;
        address[] likedBy;
        uint256 likes;
    }

    uint256 internal s;
    Socio[] public socios;
    mapping(address => uint256) internal SocioCountOf;
    mapping(address => mapping(uint256 => uint256)) public SocioCountOfAdrById;
    mapping(address => mapping(uint256 => Socio)) public SocioIdOfAdrByCount;
    mapping(uint256 => bool) public socioID;
    mapping(uint256 => bool) public commentID;

    uint256 internal c;
    Comment[] public comments;
    mapping(address => uint256) internal CommentCountOf;
    mapping(address => mapping(uint256 => uint256))
        public CommentCountOfAdrById;
    mapping(address => mapping(uint256 => Comment))
        public CommentIdOfAdrByCount;

    function makeUser(
        uint256 _id,
        uint256 _cnt,
        address _adr,
        string memory _name,
        string memory _email
    ) public returns (bool);

    function makeProfile(
        address _adr,
        string memory _avt,
        string memory _cols,
        string memory _fonts,
        uint256 _layout
    ) public returns (bool);

    function createSocio(
        uint256 _id,
        bool _master,
        bool _pin,
        uint256 _copys,
        string memory _title,
        string memory _content
    ) public returns (bool);

    function createComment(
        uint256 _id,
        uint256 _sid,
        string memory _title,
        string memory _content
    ) public returns (bool);

    function editSocio(
        uint256 _id,
        string memory _title,
        string memory _content
    ) public returns (bool);

    function editComment(
        uint256 _id,
        string memory _title,
        string memory _content
    ) public returns (bool);

    function delSocio(uint256 _id) public returns (bool);

    function delComment(uint256 _id) public returns (bool);

    function likeSocio(uint256 _id) public returns (bool);

    function likeComment(uint256 _id) public returns (bool);

    function showSocio(uint256 _id) public view returns (Socio memory);

    function showComment(uint256 _id) public view returns (Comment memory);

    function myGraph() public view returns (User memory, Profile memory);

    function lastPosts()
        public
        view
        returns (
            Socio memory,
            Socio memory,
            Socio memory
        );

    function lastComments()
        public
        view
        returns (
            Comment memory,
            Comment memory,
            Comment memory
        );

    function follow(address _follow) public returns (bool);

    function unfollow(address _follow) public returns (bool);

    function writeMessage(address _to, string memory _msg)
        public
        returns (bool);

    function readMessage(address _from) public view returns (string memory);
}
