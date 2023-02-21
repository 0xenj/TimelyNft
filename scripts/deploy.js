const hre = require("hardhat");

async function main() {
  const contract = await hre.ethers.getContractFactory("Timely");
  console.log("Deploying contract...");
  const timely = await contract.deploy();
  await timely.deployed();
  console.log("contract deployed to:", timely.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
