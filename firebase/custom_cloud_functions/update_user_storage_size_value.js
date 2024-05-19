const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

// import functions from 'firebase-functions';
// import admin from 'firebase-admin';
// import axios from 'axios';
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateUserStorageSizeValue = functions.firestore
  .document("users/{userId}/files/{fileId}")
  .onCreate(async (snapshot, context) => {
    try {
      const userId = context.params.userId;
      const fileId = context.params.fileId;
      const data = snapshot.data();

      const documentLink = data.file_url;

      // Get the size of the document
      // const documentSize = await getDocumentSize(documentLink);
      let documentSize = 0;
      try {
        // Fetch the document size using an HTTP HEAD request
        const response = await axios.head(documentLink);

        if (response.status === 200) {
          // Extract the content length from the response headers
          const contentLength = response.headers["content-length"];

          if (contentLength !== undefined) {
            const bytes = parseInt(contentLength, 10);
            const kbytes = bytes / 1024;
            const mbytes = kbytes / 1024;
            documentSize = mbytes;
          } else {
            console.log("contentLength is null");
            documentSize = 0;
          }
        }
        console.log("Status code is not 200: ");
        // Return 0 if unable to fetch the size
      } catch (error) {
        // Handle errors, e.g., log them or return a default size
        console.log("Error fetching document size:", error);
        documentSize = 0;
      }

      // console.log('Document Size:', documentSize);

      // You can perform additional actions based on the document size if needed
      await admin
        .firestore()
        .doc(`users/${userId}/files/${fileId}`)
        .update({ size_mb: documentSize });
      await admin
        .firestore()
        .doc(`users/${userId}`)
        .update({
          occupied_storage: admin.firestore.FieldValue.increment(documentSize),
        });
    } catch (error) {
      console.log("Error in cloud function:", error);
    }
    return null;
  });

// async function getDocumentSize(documentLink) {
//   try {
//     // Fetch the document size using an HTTP HEAD request
//     const response = await axios.head(documentLink);

//     if (response.status === 200) {
//       // Extract the content length from the response headers
//       const contentLength = response.headers['content-length'];

//       if (contentLength !== undefined) {
//         const bytes = parseInt(contentLength, 10);
//         const kbytes = bytes / 1024;
//         const mbytes = kbytes / 1024;
//         return mbytes;
//       }
//     }

//     // Return 0 if unable to fetch the size
//     return 0;
//   } catch (error) {
//     // Handle errors, e.g., log them or return a default size
//     console.error('Error fetching document size:', error);
//     return 0;
//   }
// }
