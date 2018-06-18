Signature-In-A-Block
=====================

- Your signature, in its cryptographic form (private-public key pair) as well 
as the actual one in written form, stored safely on the blockchain for 
very easy verification.

- Fully decentralized stack: **Ethereum** + **TensorflowJS** + **IPFS**,
Nothing is executed in a server, not even the ML training thanks to TensorflowJS, which runs on the browser

## Run Locally

You can run the dapp locally with truffle, ganache and lite-server
1. Open Ganache
2. In terminal, in the project root, run `truffle migrate`
3. Test contracts by running `truffle test`
4. Run locally, by running `npm run dev` in terminal

## Deploy to IPFS

1. In a terminal run `ipfs daemon`
2. In a second terminal, in the project root run
```
cp build/contracts/* dapp/
ipfs add -r dapp
```
3. Visit localhost:8080/ipfs/<HASH> where HASH is the hash of the dapp folder
(the last result)

## Troubleshooting

1. Error: the tx doesn't have the correct nonce. account has nonce of: <SOME NUMber> tx has nonce of: <SOME OTHER NUMBER>. Make sure MetaMask is synced with
the private blockchain. If not go to Metamask > Settings > Reset Account. Do this every time you deploy contracts with a new Ganache process

## Disclaimer
This is an experimental project for educational purposes only. It is not audited and must not be used in production, on the Ethereum main network!