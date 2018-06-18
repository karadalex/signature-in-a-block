var contracts = {};

// Is there an injected web3 instance?
if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    // If no injected web3 instance is detected, fall back to Ganache
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
}

$.getJSON('Signature.json', function(data) {
    // Get the necessary contract artifact file and instantiate it with truffle-contract
    var SignatureArtifact = data;
    contracts.Signature = TruffleContract(SignatureArtifact);

    // Set the provider for our contract
    contracts.Signature.setProvider(web3);
});

