pragma solidity ^0.6.9;

/*
 * uint256 will take less gas than uint8
 * This is because the EVM operates on 256bits/32bytes.
 * For the element smaller than 32 byytes, it has to do more operations in order to reduce the size of the element from 32 bytes to the desired size.
 * It is beneficial to use reduced-size arguments in storage values not the memory values because the compiler will pack multiple elements into one storage slot for storage values.
 * This will combine multiple reads or writes into a single operation, reducing the gas cost.
 */
contract A {
    uint256 test = 12; // execution cost 32672 gas
}

contract B {
    uint8 test = 12; // execution cost 33533 gas
}
