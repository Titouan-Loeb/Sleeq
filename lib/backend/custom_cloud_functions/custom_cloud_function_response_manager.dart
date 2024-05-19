import '/backend/schema/structs/index.dart';

class CreateUserFoldersCloudFunctionCallResponse {
  CreateUserFoldersCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class UpdateUserStorageSizeValueCloudFunctionCallResponse {
  UpdateUserStorageSizeValueCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class DeleteFolderContentCloudFunctionCallResponse {
  DeleteFolderContentCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class OnDeleteFileInStorageCloudFunctionCallResponse {
  OnDeleteFileInStorageCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class SendConsoleLogCloudFunctionCallResponse {
  SendConsoleLogCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
