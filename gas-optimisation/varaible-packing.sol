pragma solidity ^0.6.9;

/*
 * Variable packing
 * Appropriate ordering of the state variable make a huge difference on the gas cost.
 * As EVM operates on 256bits, ordering the variables appropriately will actually pack multiple elements into one storage slot.
 * Variable packing only occurs in storage — memory and call data does not get packed.
 * Structs and arrays always begin in a new storage slot — however their contents can be packed normally
 * Inheritance - When we extend a contract, the variables in the child can be packed with the variables in the parent.
 */
contract C {
    // execution cost 121964 gas
    uint128 test1 = 1;
    uint256 test2 = 1;
    uint128 test3 = 1;
}

contract D {
    // execution cost 74406 gas
    uint128 test1 = 1;
    uint128 test3 = 1;
    uint256 test2 = 1;
}
