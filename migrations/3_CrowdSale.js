var ERC20Contract = artifacts.require("ERC20");
var CrowdSaleContract = artifacts.require("CrowdSale");

module.exports = function (deployer, netowrk, accounts) {
  deployer.deploy(ERC20Contract, 100000)
    .then(contract => deployer.deploy(CrowdSaleContract, 1, accounts[1], contract.address));
};
