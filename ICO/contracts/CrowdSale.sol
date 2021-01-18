pragma solidity ^0.6.9;

import "./ERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract CrowdSale {
    using SafeMath for uint256;

    ERC20 public token;

    address payable public wallet;
    uint256 public rate;
    uint256 public weiRaised;

    event TokenPurchase(
        address indexed purchaser,
        address indexed beneficiary,
        uint256 value,
        uint256 amount
    );
    event Console(ERC20 token, address investor, uint256 totalToken);

    constructor(
        uint256 _rate,
        address payable _wallet,
        ERC20 _token
    ) public {
        require(_rate > 0);
        require(_wallet != address(0));
        // require(_token != address(0));

        rate = _rate;
        wallet = _wallet;
        token = _token;
    }

    function buyTokens(address _investor) public payable {
        uint256 weiAmount = msg.value;

        require(_investor != address(0));
        require(weiAmount != 0);

        weiRaised = weiRaised.add(weiAmount);

        uint256 tokens = weiAmount.mul(rate);
        emit Console(token, _investor, tokens);
        token.transfer(_investor, tokens);
        emit TokenPurchase(msg.sender, _investor, weiAmount, tokens);

        wallet.transfer(msg.value);
    }

    function calculateToken(uint256 _weiAmount)
        internal
        view
        returns (uint256)
    {
        return _weiAmount.mul(rate);
    }
}
