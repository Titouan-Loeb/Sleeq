const admin = require("firebase-admin/app");
admin.initializeApp();

const createUserFolders = require("./create_user_folders.js");
exports.createUserFolders = createUserFolders.createUserFolders;
const updateUserStorageSizeValue = require("./update_user_storage_size_value.js");
exports.updateUserStorageSizeValue =
  updateUserStorageSizeValue.updateUserStorageSizeValue;
const deleteFolderContent = require("./delete_folder_content.js");
exports.deleteFolderContent = deleteFolderContent.deleteFolderContent;
const onDeleteFileInStorage = require("./on_delete_file_in_storage.js");
exports.onDeleteFileInStorage = onDeleteFileInStorage.onDeleteFileInStorage;
const sendConsoleLog = require("./send_console_log.js");
exports.sendConsoleLog = sendConsoleLog.sendConsoleLog;
