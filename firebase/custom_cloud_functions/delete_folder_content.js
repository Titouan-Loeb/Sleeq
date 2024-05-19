const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteFolderContent = functions.firestore
  .document("users/{userId}/folders/{folderId}")
  .onDelete(async (snapshot, context) => {
    // const userId = context.params.userId;
    // const folderId = context.params.folderId;
    const data = snapshot.data();

    const documentSubfolders = data.folders;
    const documentFiles = data.files;

    if (documentFiles != null) {
      for (let i = 0; i < documentFiles.length; i++) {
        documentFiles[i].delete();
      }
    }
    if (documentSubfolders != null) {
      for (let i = 0; i < documentSubfolders.length; i++) {
        documentSubfolders[i].delete();
      }
    }
    return null;
  });
