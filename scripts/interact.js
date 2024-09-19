const hre = require("hardhat");

async function main() {
  const [user] = await hre.ethers.getSigners();
  const contractAddress = '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512';
  const ARDataMinter = await hre.ethers.getContractFactory("ARDataMinter");
  const arDataMinter = ARDataMinter.attach(contractAddress);

  const mintTx = await arDataMinter.mint({ value: hre.ethers.utils.parseEther("0.005") });
  await mintTx.wait();

  console.log(`Tokens have been minted to ${user.address}`);
}

main().catch(e => {
  console.error("Something went wrong: ", e);
  process.exit(1);
})
