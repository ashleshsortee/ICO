pragma solidity ^0.6.9;

contract E {
    /*
        Cost: More than function test2 
        This can be called internally or externally
        Since internal calls expects function arguements to be allocated to memory, solidity immediately
        copies array arguments to memory (This is what cost the additional gas.) 
    */
    function test1(uint256[10] memory a) public pure returns (uint256) {
        return a[5] * 2;
    }

    /*
        Cost: Less than function test1
        Doesnt allow internal calls, read directly from CALLDATA saving on the copying step(memory allocation).
    */
    function test2(uint8[10] memory a) external pure returns (uint256) {
        return a[5] * 2;
    }
}

contract F {
    E testContract = E(0xcD6a42782d230D7c13A74ddec5dD140e55499Df9);

    function test() public view {
        uint8[10] memory a = [1, 2, 3, 0, 4, 5, 6, 7, 8, 9];
        testContract.test2(a);
    }
}
