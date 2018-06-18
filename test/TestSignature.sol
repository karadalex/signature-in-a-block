pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Signature.sol";

contract TestSignature {
    Signature signature = Signature(DeployedAddresses.Signature());
    string key;
    string model;

    function testTrainSignatureModel() public {
        string memory trainedModel = "{a:1,b:2,c:3}";
        signature.trainSignatureModel(trainedModel);
        (,model) = signature.signatures(this);
        Assert.equal(trainedModel, 
            model, 
            "updated signature ML model");
    }

    function testSaveSignaturePublicKey() public {
        string memory pub = "-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCiUNaI385PH0YNNFMGzRH0UcQrjMxTUxHOktu8ZTHwdWHIZpWcmMxg2ZFI3wNAh7JS4lpZZwXJqMewC71iK8fhRPZH9Meu8NQQLUZFA+Dwds89E/O5mxip+nzrWVkfYUT/P9x1KUhOB47ZWhTwSklmVmvY5zh8/qRnwxdNMUWeMQIDAQAB-----END PUBLIC KEY-----";
        signature.saveSignaturePublicKey(pub);
        (key,) = signature.signatures(this);
        Assert.equal(pub, 
            key, 
            "saved public key");
    }

}