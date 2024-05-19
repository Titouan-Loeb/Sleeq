import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic mergeFolderAndItems(
  List<DocumentReference> folders,
  List<DocumentReference> files,
) {
  // merge the folders and the files into a new object with a isFolder boolean and a ref with the doc ref
  List<dynamic> newList = [];
  if (folders.isNotEmpty) {
    for (DocumentReference folder in folders) {
      newList.add({'ref': folder, 'isFolder': true});
    }
  }
  if (files.isNotEmpty) {
    for (DocumentReference file in files) {
      newList.add({'ref': file, 'isFolder': false});
    }
  }
  return newList;
}

List<String> addFolderToList(
  List<String> myList,
  String newElement,
) {
  myList.add(newElement);
  return myList;
}

bool findImgExt(String string) {
  var result = [".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp", ".wbmp"]
      .any(string.contains);
  return (result);
}

String urlToImgPath(String url) {
  return (url);
}

bool findPdfExt(String string) {
  var result = [".pdf"].any(string.contains);
  return (result);
}

String? createDynamicLink(
  String? dynamicLinkDomain,
  String? packageName,
  String? deepLink,
  String? params,
) {
  //null safety
  dynamicLinkDomain ??= "https://example.page.link";
  packageName ??= "app.example.com";
  deepLink ??= "page";
  params ??= "";

  String dynamicLinkCombined = dynamicLinkDomain + "?";

  //for android
  dynamicLinkCombined += "apn=" + packageName + "&";

  //for IOS
  dynamicLinkCombined += "ibi=" + packageName + "&";

  String link = "link=" +
      Uri.encodeComponent(dynamicLinkDomain + "/" + deepLink + "?" + params);

  dynamicLinkCombined += link;

  return dynamicLinkCombined;
}

bool endsWith(
  String string,
  String end,
) {
  return (string.endsWith(end));
}

bool? numberChecking(String? password) {
  // Null or empty string is not a number
  if (password == null || password.isEmpty) {
    return false;
  }

  bool found = password.contains(new RegExp(r'[0-9]'));

  return found;
}

bool? specialChar(String? password) {
  // Null or empty string is not a number
  if (password == null || password.isEmpty) {
    return false;
  }

  // Special characters allowed
  final regExp = RegExp(
      r'[\^*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' // <-- Notice the escaped symbols
      "'" // <-- ' is added to the expression
      ']');

  bool found = password.contains(regExp);
  return found;
}

bool? upperCase(String? password) {
  // Null or empty string is not a number
  if (password == null || password.isEmpty) {
    return false;
  }

  bool found = password.contains(new RegExp(r'[A-Z]'));

  return found;
}

String getStorageOccupiedRatioAsString(
  double occupied,
  double max,
) {
  double res = occupied / max;
  if (res > 1) return "1";
  if (res < 0) return "0";
  return res.toStringAsFixed(2);
}

bool? lowerCase(String? password) {
  // Null or empty string is not a number
  if (password == null || password.isEmpty) {
    return false;
  }

  bool found = password.contains(new RegExp(r'[a-z]'));

  return found;
}

bool findpkpass(String string) {
  var result = [".pkpass"].any(string.contains);
  return (result);
}

String strToLowerCase(String str) {
  return str.toLowerCase();
}

String findFileExtension(String url) {
  if (url == null || url.isEmpty) {
    return "Unknown";
  }

  url = url.split('?')[0];

  int dotIndex = url.lastIndexOf('.');
  if (dotIndex != -1 && dotIndex < url.length - 1) {
    String extension = url.substring(dotIndex + 1).toLowerCase();
    switch (extension) {
      case "png":
      case "jpg":
      case "jpeg":
        return "Image";
      case "mp4":
      case "avi":
      case "mov":
        return "Video";
      case "pdf":
        return "PDF";
      case "doc":
      case "docx":
        return "Document";
      default:
        return "Unknown";
    }
  } else {
    return "Unknown";
  }
}

String getPlanName(String? planId) {
  if (planId == null) return "Sleeq FREE";
  if (planId == "price_1O0OIABzo7KeiEME0flVyvmz") return "Sleeq FREE";
  if (planId == "price_1O0Lx5Bzo7KeiEME7XG2SbWh") return "Sleeq Family";
  if (planId == "price_1O0LviBzo7KeiEMExFgYZvmf") return "Sleeq Advanced";
  if (planId == "price_1O0LqPBzo7KeiEME3h4HMsYz") return "Sleeq+";
  if (planId == "price_1O0LqPBzo7KeiEMEKGiQNJ78") return "Sleeq+ (student)";
  return "Sleeq FREE";
}

int getPlanMaxStorageInMB(String? planId) {
  if (planId == null) return 20;
  if (planId == "price_1O0OIABzo7KeiEME0flVyvmz") return 20;
  if (planId == "price_1O0Lx5Bzo7KeiEME7XG2SbWh") return 10000;
  if (planId == "price_1O0LviBzo7KeiEMExFgYZvmf") return 10000;
  if (planId == "price_1O0LqPBzo7KeiEME3h4HMsYz") return 2000;
  if (planId == "price_1O0LqPBzo7KeiEMEKGiQNJ78") return 2000;
  return 20;
}

double getStorageOccupiedRatio(
  double occupied,
  double max,
) {
  double res = occupied / max;
  if (res > 1) return 1;
  if (res < 0) return 0;
  return res;
}

List<DocumentReference>? sortFolderList(List<DocumentReference>? listFolders) {
  if (listFolders == null) {
    return null;
  }

  listFolders.forEach((element) => element.get());

  // listFolders.sort((a, b) {
  //   var snapshot_a = a.get("name");
  //   var snapshot_b = b.get("name");
  //   // snapshot_a
  //   //     .get("name")
  //   //     .toLowerCase()
  //   //     .compareTo(snapshot_b.get("name").toLowerCase());
  // });

  return listFolders;

  // listFolders.sort((a, b) {
  //   return a['name'].toLowerCase().compareTo(b['name'].toLowerCase());
  // });
}

List<String> getCardIds() {
  List<String> knownCards = [
    "fr id card",
    "fr health card",
    "fr driving licence"
  ];
  return knownCards;

  // List<DocumentReference> cardsFound;

  // for (final file in files) {
  //   final fileSnapshot = await file.get();
  //   final fileName = fileSnapshot.get("name");
  //   if (knownCards.contains(fileName)) cardsFound.add(file);
  // }
  // return cardsFound;
  // return [];
}

List<DocumentReference> returnEmptyList() {
  List<DocumentReference> list = [];
  return list;
}
