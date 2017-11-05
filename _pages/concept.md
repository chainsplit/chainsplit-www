---
layout: page
title: Concept
permalink: /concept/
---

# Background
The Bitcoin blockchain contains coins. New coins on the Bitcoin blockchain are created by Bitcoin miners. Users can buy the rights to coins through an exchange service. Users can transfer their rights to Bitcoin coins (or part thereof) via Bitcoin transactions. Digital wallets provide users with the ability to execute transactions on the Bitcoin blockchain. Each digital wallet contains a user’s private key and is therefore a mechanism which allows users to secure their rights, as well as transfer their rights to other users via transactions. 

The Bitcoin blockchain computer code is open source (it can be legally copied and modified by a third party). Some incompatible changes to the Bitcoin software are also known as hard forks i.e. changes which modify the rules used to validate transactions and blocks. The launch of any incompatible modifications to the Bitcoin blockchain software will cause different nodes to no longer agree on transaction history. When this happens Bitcoin itself is not really affected. However, at the time when these changes take effect, the Bitcoin blockchain does split. From that point onwards two blockchains exist. It is important to remember that the blockchain contains every historical transaction and therefore when the blockchain splits each blockchain contains an identical history, right up until the chain split. 

Due to this shared transaction history, a user who holds rights to coins on the Bitcoin blockchain, before a blockchain split, automatically holds the identical rights to coins on the other chain, at the time of the blockchain split.

If neither of the chains are sporting a new and unique transaction mark, a problem arises, whereby a transaction on one chain is valid on the other chain. In this case transactions on one chain can be replayed on the other chain. A replay is not automatic, nor is it in any way part of the default operation of either chain. A replay attack can be carried out by a malicious party. The point being, that whilst a signed transaction on one chain can be repeated on the other chain, the coins are essetially stuck together.

Let's investigate this a little further in the following section which introduces Unconfirmed Transaction Outputs (UTXOs).

# Unconfirmed Transaction Outputs (UTXOs)
Your Bitcoin wallet handles spending a little differently than your wallet in the traditional sense. There are some key concepts and terminologies to grasp. Let’s start with the Bitcoin transaction. A transaction transfers your rights to coins on a single blockchain. 

All transactions contain at least one input. An input in the transaction, which you are creating, is an output from a previous transaction (except for in the case of mining, but that’s another story). These coin rights which you previously received can be signed by your wallet and sent to another Bitcoin user as part of a new transaction. But until you actually create and execute this transaction you have rights to Bitcoin coins in the form of Unspent Transaction Outputs (UTXOs).

As mentioned above when the Bitcoin blockchain splits, the UTXOs (coin rights) which you have on the original chain also exist on the newly forked chain. 

This is where chainspl.it comes in. 

Chainspl.it is a service which helps users safely split UTXOs across forks so that users are free to spend their split (uniquelly identifiable) coin rights separately, on each of the two blockchains.

Chainspl.it is non custodial, meaning all of the signing takes place on the user’s end.

For more information please see our ["Introducing chainspl.it, Easily handle forked coins"]("https://www.youtube.com/watch?v=wWkdfnqjpug&feature=youtu.be&a="){:target="_blank"} YouTube video.
