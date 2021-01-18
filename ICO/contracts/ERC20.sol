pragma solidity ^0.6.9;
import "@openzeppelin/contracts/math/SafeMath.sol";

contract ERC20 {
    using SafeMath for uint256;

    // Total number of tokens in existence
    uint256 totalSupply_;
    mapping(address => uint256) balances;
    // Delegation mapping
    mapping(address => mapping(address => uint256)) internal allowed;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed sender, address spender, uint256 value);

    constructor(uint256 _totalSupply) public {
        totalSupply_ = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address toAddress, uint256 value) public returns (bool) {
        require(balances[msg.sender] >= value);

        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[toAddress] = balances[toAddress].add(value);

        emit Transfer(msg.sender, toAddress, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowed[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);
        return true;
    }

    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return allowed[owner][spender];
    }

    function increaseApproval(address spender, uint256 addedValue)
        public
        returns (bool)
    {
        allowed[msg.sender][spender] = (
            allowed[msg.sender][spender].add(addedValue)
        );

        emit Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }

    function decreaseApproval(address spender, uint256 subtractedValue)
        public
        returns (bool)
    {
        uint256 oldValue = allowed[msg.sender][spender];

        if (subtractedValue > oldValue) {
            allowed[msg.sender][spender] = 0;
        } else {
            allowed[msg.sender][spender] = oldValue.sub(subtractedValue);
        }

        emit Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }
}
