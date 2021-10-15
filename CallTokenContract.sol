pragma solidity >=0.5.0;

contract RCCCToken {
    //interface也可以，目前还不知道其中区别，后期更新
    //以下是该合约实现的方法和公用变量
    string public name = "Tether USD";
    string public symbol = "USDT";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    function transfer(address _to, uint256 _value) public;

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success);

    function approve(address _spender, uint256 _value) public;

    // function approveAndCall(address _spender, uint256 _value, bytes _extraData) public;
    function burn(uint256 _value) public returns (bool success);

    function burnFrom(address _from, uint256 _value)
        public
        returns (bool success);
}

contract CallTokenContract {
    RCCCToken public RCCC =
        RCCCToken(0x7101ac4B6C74c08BE09BfE086B2527BdBE8b98C2); //初始化该合约

    uint256 public tokenTotalSupply; //创建的合约代币总数

    function getTokenTotalSupply() public payable returns (uint256) {
        tokenTotalSupply = RCCC.totalSupply(); //查询该代币总量赋值给a
    }

    function tokenTransfer(address _to, uint256 _value) public {
        RCCC.transfer(_to, _value);
    }
}
