var bank = artifacts.require("Bank")

module.exports = function(deployer) {
  deployer.deploy(bank)
}
