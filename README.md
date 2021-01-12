# ICO

An attempt to make a basic ERC20 token and a crowd sale contract for initial coin offering to understand the process better.

#### Deploy contract
##### Prerequisite
1. Truffle
2. Ganache GUI application
3. Metamask
##### Steps -
1. Run the Ganache application. Create a new workspace with the following configuration -
    > Truffle Projects  : ```./truffle.config```. Enter the absolute path here. 
    > Host: 127.0.0.1    
    > port: 8545,            
    > network_id: 2020
    > Gas price: 20000000000 wei (approx)
2. Compile contract
    > truffle compile
3. Deploy contract 
    > truffle migrate --reset --all
4. Use truffle console to test the contract functions.
5. Using metamask plugin you can even add the token to the wallet using the ERC20 contract address.