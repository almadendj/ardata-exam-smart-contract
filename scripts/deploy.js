const hre = require("hardhat");

async function main() {
  const AlmadenNFT = await hre.ethers.getContractFactory("AlmadenNFT");
  const almadenNFT = await AlmadenNFT.deploy();

  await almadenNFT.deployed();

  console.log("AlmadenNFT deployed to: ", almadenNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.error("Something went wrong: ", e);
    process.exit(1);
  })
