# A collection of thoughts on coinsplits in adverserial fork scenarios

Disclaimer: any perceived semblance of coherence is entirely the fault of the reader.

## Replay protection

Often, people cite the need for replay protection in planned chainsplits/hardforks. First of all, replay protection is often not actually replay protection. When people talk about replay protection, they often allow the definition to slip beyond which what you expect of the term. For example, the term "opt-in replay protection" makes no sense. Replay protection is *protection against replay*; in other words, it is not opt-in, you should not have to actively do something special to make use of it. It is okay for replay protection to be *opt out*, ie. to allow certain special/unusual/uncommon transaction types to be valid on both chains. Timelocked transactions come to mind. The main defining feature of replay protection is that it protects those who are not aware of the chainsplit from accidentally creating a replayable transaction.

## Anti-replay

When people talk about replay protection mechanisms, they often are really talking about "anti-replay mechanisms". That is, mechanisms that allow one to somehow avoid transaction replay. All replay protection is anti-replay but not vice versa. An example of such anti-replay is [B2X's now-defunct address blacklisting](https://github.com/btc1/bitcoin/pull/127). It was reverted after it was discovered to open up attack vectors on 2nd layer tech such as LN. In the scenario that this anti-replay mechanism had been engineered in such a way that it did not cause issues, this would have been an example of native anti-replay; in other words, anti-replay on the blockchain consensus layer. Unfortunately, it was not replaced with anything else, so in the case of the B2X hardfork we are stuck without native anti-replay and are forced to roll our own anti-replay. What an interesting challenge :)

## Coinsplit propagation

Let's assume one somehow has a transaction that can never be replayed on the other chain. It is not relevant yet how one gets one of these, let's just assume that I have successfully split a single UTXO on both chains, say chain A and chain B, into two different ones on the different chains. I started with UTXO U1, and now have UTXO A1 and B1. If I then have UTXO U2 on both chains, I can split them quite easily by creating a TX that takes inputs U2 and A1 to create output A2; this will only be valid on chain A, and I can create another TX that takes inputs U2 and B1 to create output B2; this will only be valid in chain B. I have now successfully *propagated the split to* coin U2. It is also possible for me to enter a coinjoin transaction with a friend (or customer) to provide a coinsplitting service to them.

## Coinsplit seeding

The big question now is, how do we bootstrap this process? Where do we get the first split coin; the coinsplit-seed? I am aware of two fundamentally different approaches, with different properties in terms of speed and security in the face of malicious actors.

- Post-fork mining rewards. After the fork happens, newly mined coins on either chain will never exist on the other chain, so these are a more secure source of split coins, although they are locked for 100 blocks, so it takes quite some time for them to become available after the fork.
- Double-spend to self. The idea is to try to get two different transactions confirmed on the different chains; this is done to oneself in case the split fails and one of the transactions is mined on both chains. Optionally aided with mechanisms such as nLockTime and RBF to increase the chances of successfully avoiding a replay before the double-spend is confirmed. This is a relatively quick method, as it can hypothetically be done in the first block after the fork, but it comes with more risks in the face of malicious users.

## Reorg risk

The biggest risk involved in coinsplitting mechanisms is the chance of a powerful mining entity reorg-attacking a low-hashrate chain. In the best case, this undoes the split, in the worst case, this leads to funds being stolen. Let's explore some different scenarios for funds getting stolen in one way or the other.

- The fork happens. I acquire some post-fork coinbase dust on chain A and split my entire wallet on this chain. I sell the coins on chain B. Chain A is reorged, invalidating those chain A transactions forever. My transactions from chain B are replayed on chain A and I lose the coins I intended to keep.

- The fork happens. I acquire some post-fork coinbase dust on chain A and split my entire wallet on this chain. I sell the coins on chain A. Chain A is reorged, invalidating those chain A transactions forever. I gain back the coins on chain A and my buyer is pissed unless I create a new transaction to him.

Either of these scenarios are relatively unlikely because of how massive the reorganization would need to be (100 blocks or more). Now let's look at some more likely scenarios:

- The fork happens. I acquire some post-fork coinbase dust on chain A and split my entire wallet on this chain. I sell the coins on chain B. Chain B is reorged, and I get my funds back. However, the buyer can replay the transaction that gets him his funds, unless I actively double-spend.

- The fork happens. I acquire some post-fork coinbase dust on chain A and split my entire wallet on this chain. I sell the coins on chain A. Chain B is reorged, but neither me nor my buyer are affected.

- The fork happens. I double-spend a coin and split my entire wallet on both chains. I sell my coins on the shorter chain. It is reorged but my transactions on the longer chain are not invalidated. The worst that happens is that my transactions-to-self from the longer chain are replayed. If they are before the transaction to my buyer is reconfirmed, my buyer is pissed unless I create a new transaction to him.

- The fork happens. I double-spend a coin and split my entire wallet on both chains. I sell my coins on the longer chain. The shorter chain is reorged but my transactions on the longer chain are not invalidated. My transaction to my buyer is replayed on the shorter chain and I lose the coins I intended to keep.

We can see that in similar scenarios, using coinbase dust is safer for honest parties, although it is not entirely risk-free either. The worst-case scenario in the upcoming fork I can see being somewhat plausible is miners mining B2X for a day or two unprofitably, buying a lot of B2X during that time, then subsequently reorg-attacking the low-hashrate BTC chain and replaying the B2X transactions, gaining BTC at a bargain. This attack is made impossible if you sell B2X that has been split with post-fork mining rewards. Be safe.

## Update

It seems like there may be a possibility to do native anti-replay on B2X after all using a consensus discrepancy in the amount of sigops allowed in a block. This is still being worked out, but if it is true it is the superior option. Unfortunately, this will be one-way protection, and will only protect the BTC chain against replays of B2X transactions; in other words it is mostly good if you want to sell B2X without losing your BTC.
