const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.sendConsoleLog = functions
  .region("europe-west1")
  .https.onCall((data, context) => {
    // Write your code below!
    console.log("T'as supprimé un fichier fréro");
    // Write your code above!
    return;
  });
