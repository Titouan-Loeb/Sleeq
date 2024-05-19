const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.onDeleteFileInStorage = functions.firestore
  .document("users/{userId}/files/{fileId}")
  .onDelete(async (snapshot, context) => {
    try {
      const userId = context.params.userId;
      // const fileId = context.params.fileId;
      const data = snapshot.data();

      const documentLink = data.file_url;
      const documentSize = data.size_mb;

      await admin
        .firestore()
        .doc(`users/${userId}`)
        .update({
          occupied_storage: admin.firestore.FieldValue.increment(-documentSize),
        });
      console.log("Removed from user: ", documentSize);
      await functions.storage.storage().refFromURL(documentLink).delete();
    } catch (error) {
      console.log("Error in cloud function:", error);
    }
    return null;
  });
