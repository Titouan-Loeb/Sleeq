const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Define the folders and their respective colors in hex format
const folderData = [
  { name: "Car", color: "#0000FF" }, // Blue
  { name: "Health", color: "#008000" }, // Green
  { name: "House", color: "#FF0000" }, // Red
  { name: "Identity", color: "#FFFF00" }, // Yellow
];

exports.createUserFolders = functions.auth.user().onCreate(async (user) => {
  return null;
  const { uid } = user;

  const foldersRef = admin
    .firestore()
    .collection("users")
    .doc(uid)
    .collection("folders");
  const usersRef = admin.firestore().collection("users");

  // Create folders for the user with the specified hex color
  const folderPromises = folderData.map(async (folder) => {
    const { name, color } = folder;
    const folderDocRef = foldersRef.doc();
    await folderDocRef.set({
      owner: uid,
      name: name,
      color: color,
    });
  });

  await Promise.all(folderPromises);

  // Create the root folder for the user and reference all the newly created folders
  const rootFolderRef = foldersRef.doc();
  await rootFolderRef.set({
    owner: uid,
    name: "Root",
    color: "#FFFFFF", // You can set the color for the root folder
    folders: folderData.map(() => foldersRef.doc()), // Reference all the newly created folders
  });

  // Update the user's data with the root folder reference
  await usersRef.doc(uid).update({ root_folder: rootFolderRef });

  console.log(`Created folders for user: ${uid}`);
  return null;
});
