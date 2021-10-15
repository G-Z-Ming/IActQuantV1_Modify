pragma solidity >=0.5.0;

import "./BEP20USDT.sol";

contract ActQuantV1 {
    address public ActQuantV1owner;

    address public CollectionAddress =
        0x5Fdf95f23a24b7419583943FA003D39848dDB7C1;

    BEP20USDT public INIT_BSC_USD =
        BEP20USDT(0x7101ac4B6C74c08BE09BfE086B2527BdBE8b98C2);

    uint8 private CommodityPrice = 10;

    modifier onlyOwner() {
        require(
            msg.sender == ActQuantV1owner,
            "Ownable: caller is not the owner"
        );
        _;
    }

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(address _owner) public {
        ActQuantV1owner = _owner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        ActQuantV1owner = newOwner;
    }

    function getCommodityPrice() external view returns (uint8) {
        return CommodityPrice;
    }

    function setCommodityPrice(uint8 newCommodityPrice) external onlyOwner {
        CommodityPrice = newCommodityPrice;
    }

    function CommodityPurchaseDeduction(uint256 value) public {
        INIT_BSC_USD.transferFrom(msg.sender, CollectionAddress, value);
        emit Transfer(msg.sender, CollectionAddress, value);
    }
}
