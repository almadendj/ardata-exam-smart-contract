require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  networks: {
    hardhat: {
      chainId: 1337
    },
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: [process.env.PRIVATE_KEY]
    },
    holesky: {
      url: "https://ethereum-holesky-rpc.publicnode.com",
      chainId: 17000,
      accounts: [process.env.PRIVATE_KEY]
    },
    etherscan: {
      apiKey: process.env.ETHERSCAN_API_KEY,
      url: "https://api-sepolia.etherscan.io/api",
    }
  }
};
