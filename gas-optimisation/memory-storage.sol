pragma solidity ^0.6.9;

/*
 * Memory vs. Storage
 * Performing operations on memory — or call data, which is similar to memory — is always cheaper than storage.
 * A common way to reduce the number of storage operations is manipulating a local memory variable before assigning it to a storage variable.
 */
contract A {
    uint256 num = 5;
    uint256 total;

    function updateTotal(uint256 timesteps) external {
        uint256 r = 2;
        for (uint256 i = 0; i < timesteps; i++) {
            r = r * num;
        }
        total = r;
    }
}
