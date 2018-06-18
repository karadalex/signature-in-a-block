var canvas = document.querySelector("canvas");

var signaturePad = new SignaturePad(canvas, {
    // It's Necessary to use an opaque color when saving image as JPEG;
    // this option can be omitted if only saving as PNG or SVG
    backgroundColor: 'rgb(255, 255, 255)'
});


// Start training from the new data
$('#train').on('click', function(event) {
    // Get the data from the signature pad
    // I use 'toData()' method because it returns much richer information
    // for the signature, than a picture, i.e. points in time, when mouse
    // was lifted and then down again etc. => More features for 
    // the Machine Learning
    var padData = signaturePad.toData();

    // Do the training here using the data above


    // Upload trained model to Blockchain
    var signatureInstance;

    contracts.Signature.deployed().then(function(instance) {
        signatureInstance = instance;

        return signatureInstance.trainSignatureModel(padData.toString(), {from: account});
    }).then(function(result) {
        console.log(result);
    }).catch(function(err) {
        console.log(err.message);
    });
})