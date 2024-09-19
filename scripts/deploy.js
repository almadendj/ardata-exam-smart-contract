const hre = require("hardhat");

async function main() {
  const ARDataMinter = await hre.ethers.getContractFactory("ARDataMinter");
  const arDataMinter = await ARDataMinter.deploy();

  await arDataMinter.deployed();

  console.log("ARDataMinter deployed to: ", arDataMinter.address);
}

main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.error("Something went wrong: ", e);
    process.exit(1);
  })
