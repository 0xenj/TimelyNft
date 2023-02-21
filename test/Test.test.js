const { expect } = require("chai");
const { assert } = require("chai");
const { ethers } = require("hardhat");
const Helper = require("./shared/setup");

describe("RightBullet", function () {
  before(async function () {
    [provider, owner, user1, user2, user3] =
      await Helper.setupProviderAndAccount();
  });

  beforeEach(async function () {
    contract = await Helper.setupContract([user1.address, user2.address]);
  });

  it("Should initialize the contract correctly ? (should be)", async function () {});
});
