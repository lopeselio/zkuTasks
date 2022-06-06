# zku application (6 Jun 2022)

### 1. What is a hash? Why do people use hashing to hide information?
A hash is a compressed numerical value generated out of an input as a result of a one-way cryptographic hashing function or calculations. People use hashes to store their important password and secure data through hashes as they are too vulnerable to be stored blindly. Examples include an on-chian will system for passing one's will to the successor.

### 2. What is a smart contract?
A piece of code(functions and methods) intended to execute, control and keep track of events according to a set of agreements

### 3. What are gas fees? Why is gas optimization a big focus when building smart contracts?
Gas fees are compensation costs provided by users to provide computational energy for a transaction to go through, thus helping to incentivise miner nodes and preventing sybil attacks. Gas optimisations focus on better external calls to the smart contract and reducing gas prices for the smart contract. Larger processing times due non-optimised gas heavy parameters inside the contract could lead to exploits. Gas optimization increases throughput, lowers the transaction time, rendering the smart contract more affordable to use.

### 4. You have the ability to quickly count the number of leaves in a tree. How can you prove this to a friend, without revealing the exact number of leaves?
Using zk-rollups (ZK proofs and ZK snarks) and using Merkle Hash and computing Merkel root, we can easily prove the above to a friend, without revealing the exact number of leaves.

### 5. How are smart contracts deployed? List the necessary steps.
Smart contracts are deployed using Truffle, HardHat, DappTools, Brownie, Foundry, Waffle, Saddle, configured on the specific node RPC, and after deploying them, the compiled contracts are migrated to the network mentioned in truffle network configuration file, or hardhat scripts. Else they can be deployed directly using Injected Web3 on Remix, with connection to the wallet.

### 7. Is the new design better over having separate confirmReceived() and refundSeller()? Why or why not?
Yes, because the transaction will remain locked until confirmReceived() is called. The new design is better and more gas efficient.

### Question 6 and 8 can be seen in the following links, explained in the respective markdown files 
[Question 6](https://github.com/lopeselio/zkuTasks/blob/master/Question%206/Readme.md)


[Question 8]()
