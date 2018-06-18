pragma solidity ^0.4.24;

contract Signature {
    
    struct mySignature {
        string signaturePublicKey;
        string signatureTrainedMLModel;
    }

    mapping (address => mySignature) public signatures;

    function trainSignatureModel(string newTrainedModel) public {
        mySignature storage sign = signatures[msg.sender];
        sign.signatureTrainedMLModel = newTrainedModel;
    }

    function saveSignaturePublicKey(string _publicKey) public {
        mySignature storage sign = signatures[msg.sender];
        sign.signaturePublicKey = _publicKey;
    }
}