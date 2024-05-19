// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class DocField {
  final String template;
  String? value;

  DocField({required this.template, this.value});
}

class IdCardFR {
  DocField title = DocField(template: "RÉPUBLIQUE FRANÇAISE");
  DocField docType =
      DocField(template: "CARTE NATIONALE D'IDENTITÉ/IDENTITY CARD");
  DocField lastName = DocField(template: "NOM/Surname");
  DocField firstName = DocField(template: "Prénoms/Given names");
  DocField sex = DocField(template: "SEXE/sex");
  DocField nationality = DocField(template: "NATIONALITÉ/Nationality");
  DocField birthDate = DocField(template: "DATE DE NAISS/Date of birth");
  DocField birthPlace = DocField(template: "LIEU DE NAISSANCE/Place of birth");
  DocField commonName = DocField(template: "NOM D'USAGE/Alternate name");
  DocField documentNumber = DocField(template: "Nº DU DOCUMENT/Document No");
  DocField expirationDate = DocField(template: "Date D'EXPIR/Expiry date");
  List<String> templates = [];
  String documentName = "French Identity Card";
  List<String> tagList = ["fr id card", "id", "travel", "french", "card"];
  double percentage = 0;

  IdCardFR() {
    templates = [
      title.template,
      docType.template,
      lastName.template,
      firstName.template,
      sex.template,
      nationality.template,
      birthDate.template,
      birthPlace.template,
      commonName.template,
      documentNumber.template,
      expirationDate.template,
    ];
  }
}

class OldIdCardFR {
  DocField title = DocField(template: "RÉPUBLIQUE FRANÇAISE");
  DocField docType = DocField(template: "CARTE NATIONALE D'IDENTITÉ Nº");
  DocField nationality = DocField(template: "Nationalité Française");
  DocField lastName = DocField(template: "Nom");
  DocField firstName = DocField(template: "Prénom(s)");
  DocField sex = DocField(template: "Sexe");
  DocField birthDate = DocField(template: "Né(e) le");
  DocField birthPlace = DocField(template: "à :");
  DocField height = DocField(template: "Taille");
  DocField signature1 = DocField(template: "Signature");
  DocField signature2 = DocField(template: "du titulaire");
  List<String> templates = [];
  String documentName = "French Old Identity Card";
  List<String> tagList = ["fr id card", "id", "travel", "french", "card"];
  double percentage = 0;

  OldIdCardFR() {
    templates = [
      title.template,
      docType.template,
      nationality.template,
      lastName.template,
      firstName.template,
      sex.template,
      birthDate.template,
      birthPlace.template,
      height.template,
      signature1.template,
      signature2.template,
    ];
  }
}

class IdCardSP {
  DocField title = DocField(template: "REINO DE ESPAÑA");
  DocField countryCode = DocField(template: "ES");
  DocField documentType = DocField(template: "DOCUMENTO NACIONAL DE IDENTIDAD");
  DocField dni = DocField(template: "DNI");
  DocField lastName = DocField(template: "APELLIDOS");
  DocField firstName = DocField(template: "NOMBRE");
  DocField sex = DocField(template: "SEXO");
  DocField nationality = DocField(template: "NACIONALIDAD");
  DocField birthDate = DocField(template: "NACIMIENTO");
  DocField issueDate = DocField(template: "EMISIÓN");
  DocField expiryDate = DocField(template: "VALIDEZ");
  DocField soporte = DocField(template: "NUM SOPORTE");
  DocField bottomDescription =
      DocField(template: "NATIONAL IDENTITY CARD/DOCUMENTO NACIONAL IDENTIDAD");
  DocField residence = DocField(template: "DOMICILIO");
  DocField birthPlace = DocField(template: "LUGAR DE NACIMIENTO");
  DocField parents = DocField(template: "HIJO/A DE");
  List<String> templates = [];
  String documentName = "Spanish Identity Card";
  List<String> tagList = ["sp id card", "id", "travel", "spanish", "card"];
  double percentage = 0;

  IdCardSP() {
    templates = [
      title.template,
      countryCode.template,
      documentType.template,
      dni.template,
      lastName.template,
      firstName.template,
      sex.template,
      nationality.template,
      birthDate.template,
      issueDate.template,
      expiryDate.template,
      soporte.template,
      bottomDescription.template,
      residence.template,
      birthPlace.template,
      parents.template
    ];
  }
}

class IdCardIT {
  DocField field1 = DocField(template: "REPUBBLICA ITALIANA");
  DocField field2 = DocField(template: "MINISTERO DELL'INTERNO");
  DocField field3 = DocField(template: "IT");
  DocField field4 = DocField(template: "CARTA DI IDENTITÀ / IDENTITY CARD");
  DocField field5 = DocField(template: "COMUNE DI / MUNICIPALITY");
  DocField field6 = DocField(template: "COGNOME / SURNAME");
  DocField field7 = DocField(template: "NOME / NAME");
  DocField field8 = DocField(template: "LUOGO E DATA DI NASCITA");
  DocField field9 = DocField(template: "PLACE AND DATE OF BIRTH");
  DocField field10 = DocField(template: "SESSO");
  DocField field11 = DocField(template: "SEX");
  DocField field12 = DocField(template: "STATURA");
  DocField field13 = DocField(template: "HEIGHT");
  DocField field14 = DocField(template: "CITTADINANZA");
  DocField field15 = DocField(template: "NATIONALITY");
  DocField field16 = DocField(template: "EMISSIONE / ISSUING");
  DocField field17 = DocField(template: "SCADENZA / EXPIRY");
  DocField field18 = DocField(template: "FIRMA DEL TITOLARE");
  DocField field19 = DocField(template: "HOLDER'S SIGNATURE");

  List<String> templates = [];
  String documentName = "Italian Identity Card";
  List<String> tagList = ["it id card", "id", "travel", "italian", "card"];
  double percentage = 0;

  IdCardIT() {
    templates = [
      field1.template,
      field2.template,
      field3.template,
      field4.template,
      field5.template,
      field6.template,
      field7.template,
      field8.template,
      field9.template,
      field10.template,
      field11.template,
      field12.template,
      field13.template,
      field14.template,
      field15.template,
      field16.template,
      field17.template,
      field18.template,
      field19.template,
    ];
  }
}

class IdCardPO {
  DocField field1 = DocField(template: "CARTÃO DE CIDADÃO");
  DocField field2 = DocField(template: "CITIZEN CARD");
  DocField field3 = DocField(template: "PORTUGAL");
  DocField field4 =
      DocField(template: "REPÚBLICA PORTUGUESA | PORTUGUESE REPUBLIC");

  List<String> templates = [];
  String documentName = "Portuguese Identity Card";
  List<String> tagList = ["po id card", "id", "travel", "portuguese", "card"];
  double percentage = 0;

  IdCardPO() {
    templates = [
      field1.template,
      field2.template,
      field3.template,
      field4.template,
    ];
  }
}

class IdCardGE {
  DocField field1 = DocField(template: "BUNDESREPUBLIK DEUTSCHLAND");
  DocField field2 = DocField(
      template:
          "FEDERAL REPUBLIC OF GERMANY / REPUBLIQUE FEDERALE D'ALLEMAGNE");
  DocField field3 = DocField(template: "PERSONALAUSWEIS");
  DocField field4 = DocField(template: "IDENTITY CARD / CARTE D'IDENTITE");

  List<String> templates = [];
  String documentName = "German Identity Card";
  List<String> tagList = ["ge id card", "id", "travel", "german", "card"];
  double percentage = 0;

  IdCardGE() {
    templates = [
      field1.template,
      field2.template,
      field3.template,
      field4.template,
    ];
  }
}

class HealthCardFR {
  DocField title = DocField(template: "VITALE");
  DocField docType = DocField(template: "carte d'assurance maladie");
  DocField issueDate = DocField(template: "émise le");
  List<String> templates = [];
  String documentName = "";
  List<String> tagList = [
    "fr health card",
    "health",
    "official",
    "french",
    "card",
    "medical"
  ];
  double percentage = 0;

  HealthCardFR() {
    templates = [
      title.template,
      docType.template,
      issueDate.template,
    ];
  }
}

class HealthCardEU {
  DocField field1 = DocField(template: "CARTE EUROPÉENNE D'ASSURANCE MALADIE");
  DocField field2 = DocField(template: "FR");
  DocField field3 = DocField(template: "3 Nom");
  DocField field4 = DocField(template: "4 Prénom");
  DocField field5 = DocField(template: "5 Date de naissance");
  DocField field6 = DocField(template: "6 Numéro d'identification personnel");
  DocField field7 =
      DocField(template: "7 Numéro d'identification de l'institution");
  DocField field8 = DocField(template: "8 Numéro d'identification de la carte");
  DocField field9 = DocField(template: "9 Date d'expiration");
  List<String> templates = [];
  String documentName = "";
  List<String> tagList = [
    "eu health card",
    "health",
    "official",
    "european",
    "card",
    "medical"
  ];
  double percentage = 0;

  HealthCardEU() {
    templates = [
      field1.template,
      field2.template,
      field3.template,
      field4.template,
      field5.template,
      field6.template,
      field7.template,
      field8.template,
      field9.template,
    ];
  }
}

class PassportIT {
  DocField title = DocField(template: "REPUBBLICA ITALIANA");
  DocField documentType = DocField(template: "PASSAPORTO");
  DocField subtitleFields = DocField(
      template:
          "Tipo. Type. Type. Codice paese. Code of issuing State. Code du Pays émetteur. Passaporto N. Passport No. Passeport N°.");
  DocField lastName = DocField(template: "Cognome. Surname. Nom (1)");
  DocField firstName = DocField(template: "Nome. Given names. Prénoms (2)");
  DocField nationality =
      DocField(template: "Cittadinanza. Nationality. Nationalité (3)");
  DocField birthDate = DocField(
      template: "Data di nascita. Date of birth. Date de naissance (4)");
  DocField sex = DocField(template: "Sesso. Sex. Sexe (5)");
  DocField birthPlace = DocField(
      template: "Luogo di nascita. Place of birth. Lieu de naissance (6)");
  DocField issueDate = DocField(
      template: "Data di rilascio. Date of issue. Date de délivrance (7)");
  DocField expiryDate = DocField(
      template: "Data di scadenza. Date of expiry. Date d'expiration (8)");
  DocField authority = DocField(template: "Autorità. Authority. Autorité (9)");
  DocField signature = DocField(template: "Firma del titolare. (10)");
  DocField countryCode = DocField(template: "ITA");
  List<String> templates = [];
  String documentName = "Italian Passport";
  List<String> tagList = [
    "it passport",
    "id",
    "travel",
    "italian",
    "passport",
    "official"
  ];
  double percentage = 0;

  PassportIT() {
    templates = [
      title.template,
      documentType.template,
      subtitleFields.template,
      lastName.template,
      firstName.template,
      lastName.template,
      nationality.template,
      birthDate.template,
      sex.template,
      birthPlace.template,
      issueDate.template,
      expiryDate.template,
      authority.template,
      signature.template,
      countryCode.template,
    ];
  }
}

class PassportSP {
  DocField title = DocField(template: "ESPAÑA");
  DocField subtitle = DocField(template: "REINO DE ESPAÑA");
  DocField documentType = DocField(template: "PASAPORTE");
  DocField type = DocField(template: "Tipo/Type/Type");
  DocField countryCode = DocField(template: "Código/Code/Code");
  DocField documentNumber =
      DocField(template: "PASAPORTE N°/PASSPORT No/PASSEPORT N°");
  DocField lastName = DocField(template: "(1) Apellidos/Surname/Nom");
  DocField firstName = DocField(template: "(2) Nombre/Given Names/Prénoms");
  DocField nationality =
      DocField(template: "(3) Nacionalidad/Nationality/Nationalité");
  DocField birthDate = DocField(
      template: "(4) Fecha de nacimiento/Date of birth/Date de naissance");
  DocField sex = DocField(template: "(5) Sexo/Sex/Sexe");
  DocField birthPlace = DocField(
      template: "(6) Lugar de nacimiento/Place of birth/Lieu de naissance");
  DocField issueDate = DocField(
      template: "(7) Fecha de expedición/Date of issue/Date de délivrance");
  DocField expiryDate = DocField(
      template: "(8) Fecha de caducidad/Date of expiry/Date d'expiration");
  DocField authority = DocField(template: "(9) Autoridad/Authority/Autorité");
  DocField signature = DocField(
      template:
          "(10) Firma del titular/Holder's signature/Signature du titulaire");
  DocField idNumber = DocField(template: "(11) Id.No.");
  List<String> templates = [];
  String documentName = "Spanish Passport";
  List<String> tagList = [
    "sp passport",
    "id",
    "travel",
    "spanish",
    "passport",
    "official"
  ];
  double percentage = 0;

  PassportSP() {
    templates = [
      title.template,
      subtitle.template,
      documentType.template,
      type.template,
      countryCode.template,
      documentNumber.template,
      lastName.template,
      firstName.template,
      nationality.template,
      birthDate.template,
      sex.template,
      birthPlace.template,
      issueDate.template,
      expiryDate.template,
      authority.template,
      signature.template,
      idNumber.template,
    ];
  }
}

class PassportFR {
  DocField title = DocField(template: "RÉPUBLIQUE FRANÇAISE");
  DocField docType1 = DocField(template: "PASSEPORT");
  DocField docType2 = DocField(template: "PASSPORT");
  DocField type = DocField(template: "Type/Type");
  DocField countryCode = DocField(template: "Code du pays/Country code");
  DocField documentNumber = DocField(template: "Passeport nº/Passport no");
  DocField lastName = DocField(template: "Nom/Surname (1)");
  DocField firstName = DocField(template: "Prénoms/Given names (2)");
  DocField nationality = DocField(template: "Nationalité/Nationality (3)");
  DocField infos = DocField(
      template:
          "Sexe/Sex (5) Taille/Height (12) Couleur des yeux/Colour of eyes (13)");
  DocField birthDate =
      DocField(template: "Date de naissance/Date of birth (4)");
  DocField birthPlace =
      DocField(template: "Lieu de naissance/Place of birth (6)");
  DocField dateOfIssue =
      DocField(template: "Date de délivrance/Date of issue (7)");
  DocField residence = DocField(template: "Domicile/Residence (11)");
  DocField authority = DocField(template: "Autorité/Authority");
  DocField expirationDate =
      DocField(template: "Date d'expiration/Date of expiry (8)");
  List<String> templates = [];
  String documentName = "French Passport";
  List<String> tagList = ["fr passport", "passport", "id", "travel", "french"];
  double percentage = 0;

  PassportFR() {
    templates = [
      title.template,
      docType1.template,
      docType2.template,
      type.template,
      countryCode.template,
      documentNumber.template,
      lastName.template,
      firstName.template,
      nationality.template,
      infos.template,
      birthDate.template,
      birthPlace.template,
      dateOfIssue.template,
      residence.template,
      authority.template,
      expirationDate.template,
    ];
  }
}

class PassportGE {
  DocField title = DocField(template: "BUNDESREPUBLIK DEUTSCHLAND");
  DocField documentType = DocField(template: "REISEPASS");
  List<String> templates = [];
  String documentName = "German Passport";
  List<String> tagList = ["ge passport", "passport", "id", "travel", "german"];
  double percentage = 0;

  PassportGE() {
    templates = [
      title.template,
      documentType.template,
    ];
  }
}

class PassportPO {
  DocField title = DocField(
      template:
          "República Portuguesa Portuguese Republic République Portuguaise");
  DocField documentType = DocField(template: "Passaporte");
  List<String> templates = [];
  String documentName = "Portuguese Passport";
  List<String> tagList = [
    "po passport",
    "passport",
    "id",
    "travel",
    "portuguese"
  ];
  double percentage = 0;

  PassportPO() {
    templates = [
      title.template,
      documentType.template,
    ];
  }
}

class VisaFR {
  DocField title = DocField(template: "FRANCE/FRANCE/FRANCE");
  DocField countryCode = DocField(template: "FRA");
  DocField docType = DocField(template: "VISA");
  DocField validFor = DocField(template: "VALABLE POUR");
  DocField validFrom = DocField(template: "DU");
  DocField validTo = DocField(template: "AU");
  DocField visaType = DocField(template: "TYPE DU VISA");
  DocField passportNumber = DocField(template: "PASSEPORT Nº");
  DocField deliveredTo = DocField(template: "DÉLIVRÉ À");
  DocField name = DocField(template: "NOM, PRÉNOM");
  DocField travelTime = DocField(template: "DURÉE DE SÉJOUR");
  DocField nbEntry = DocField(template: "NOMBRE D'ENTRÉES");
  DocField date = DocField(template: "LE");
  DocField signature = DocField(template: "Signé");
  List<String> templates = [];
  String documentName = "French Visa";
  List<String> tagList = ["fr visa", "visa", "travel", "french", "official"];
  double percentage = 0;

  VisaFR() {
    templates = [
      title.template,
      countryCode.template,
      docType.template,
      validFor.template,
      validFrom.template,
      validTo.template,
      visaType.template,
      passportNumber.template,
      deliveredTo.template,
      name.template,
      travelTime.template,
      nbEntry.template,
      date.template,
      signature.template
    ];
  }
}

class DrivingLicenceFR {
  DocField title =
      DocField(template: "PERMIS DE CONDUIRE RÉPUBLIQUE FRANÇAISE");
  List<String> templates = [];
  String documentName = "French Driving License";
  List<String> tagList = [
    "fr driving licence",
    "car",
    "drive",
    "licence",
    "french",
    "official"
  ];
  double percentage = 0;

  DrivingLicenceFR() {
    templates = [
      title.template,
    ];
  }
}

class DrivingLicenceSP {
  DocField title = DocField(template: "PERMISO DE CONDUCCIÓN REINO DE ESPAÑA");
  List<String> templates = [];
  String documentName = "Spanish Driving License";
  List<String> tagList = [
    "sp driving licence",
    "car",
    "drive",
    "licence",
    "spanish",
    "official"
  ];
  double percentage = 0;

  DrivingLicenceSP() {
    templates = [
      title.template,
    ];
  }
}

class DrivingLicenceIT {
  DocField field1 = DocField(template: "PATENTE DI GUIDA");
  DocField field2 = DocField(template: "REPUBBLICA ITALIANA");
  List<String> templates = [];
  String documentName = "Italian Driving License";
  List<String> tagList = [
    "it driving licence",
    "car",
    "drive",
    "licence",
    "italian",
    "official"
  ];
  double percentage = 0;

  DrivingLicenceIT() {
    templates = [field1.template, field2.template];
  }
}

class DrivingLicenceGE {
  DocField field1 =
      DocField(template: "FÜHRERSCHEIN BUNDESREPUBLIK DEUTSCHLAND");

  List<String> templates = [];
  String documentName = "German Driving License";
  List<String> tagList = [
    "ge driving licence",
    "car",
    "drive",
    "licence",
    "german",
    "official"
  ];
  double percentage = 0;

  DrivingLicenceGE() {
    templates = [
      field1.template,
    ];
  }
}

class DrivingLicencePO {
  DocField field1 =
      DocField(template: "CARTA DE CONDUÇÃO | REPÚBLICA PORTUGUESA");

  List<String> templates = [];
  String documentName = "Portuguese Driving License";
  List<String> tagList = [
    "po driving licence",
    "car",
    "drive",
    "licence",
    "portuguese",
    "official"
  ];
  double percentage = 0;

  DrivingLicencePO() {
    templates = [
      field1.template,
    ];
  }
}

class DrivingLicenceUS {
  DocField title = DocField(template: "Driver License");
  List<String> templates = [];
  String documentName = "US Driving License";
  List<String> tagList = [
    "us driving license",
    "car",
    "drive",
    "license",
    "us",
    "official"
  ];
  double percentage = 0;

  DrivingLicenceUS() {
    templates = [
      title.template,
    ];
  }
}

class VehicleLicenceFR {
  DocField documentType = DocField(template: "CERTIFICAT D'IMMATRICULATION");
  List<String> templates = [];
  String documentName = "French Vehicle Licence";
  List<String> tagList = [
    "fr vehicle licence",
    "car",
    "drive",
    "licence",
    "french",
    "vehicle"
  ];
  double percentage = 0;

  VehicleLicenceFR() {
    templates = [
      documentType.template,
    ];
  }
}

int getLevenshteinDistance(String a, String b) {
  a = a.toUpperCase();
  b = b.toUpperCase();
  int sa = a.length;
  int sb = b.length;
  int i, j, cost, min1, min2, min3;
  int lev;
  List<List<int>> d = List.generate(
      sa + 1, (int i) => List<int>.generate(sb + 1, (int j) => 0));
  if (a.length == 0) {
    lev = b.length;
    return (lev);
  }
  if (b.length == 0) {
    lev = a.length;
    return (lev);
  }
  for (i = 0; i <= sa; i++) d[i][0] = i;
  for (j = 0; j <= sb; j++) d[0][j] = j;
  for (i = 1; i <= a.length; i++)
    for (j = 1; j <= b.length; j++) {
      if (a[i - 1] == b[j - 1])
        cost = 0;
      else
        cost = 1;
      min1 = (d[i - 1][j] + 1);
      min2 = (d[i][j - 1] + 1);
      min3 = (d[i - 1][j - 1] + cost);
      d[i][j] = min(min1, min(min2, min3));
    }
  lev = d[a.length][b.length];
  return (lev);
}

double checkSimilarity(String a, String b) {
  double similarity;
  similarity = 1 - getLevenshteinDistance(a, b) / (max(a.length, b.length));
  return similarity * 100;
}

List<String> convertToArray(String string) {
  List<String> result = string.split('\n');
  return result;
}

dynamic getDocumentType(List<dynamic> frenchTemplates) {
  dynamic highestPercentageTemplate = frenchTemplates[0];
  for (int i = 0; i != frenchTemplates.length; i++) {
    if (frenchTemplates[i].percentage > highestPercentageTemplate.percentage) {
      highestPercentageTemplate = frenchTemplates[i];
    }
  }
  return highestPercentageTemplate;
}

List<String> getTags(String response) {
  List<dynamic> templates = [
    IdCardFR(),
    OldIdCardFR(),
    IdCardSP(),
    IdCardIT(),
    IdCardPO(),
    IdCardGE(),
    HealthCardFR(),
    HealthCardEU(),
    PassportIT(),
    PassportSP(),
    PassportFR(),
    PassportGE(),
    PassportPO(),
    VisaFR(),
    DrivingLicenceFR(),
    DrivingLicenceSP(),
    DrivingLicenceIT(),
    DrivingLicenceGE(),
    DrivingLicenceUS(),
    DrivingLicencePO(),
    VehicleLicenceFR()
  ];
  List<String> responseArray = convertToArray(response);
  int cmt = 0;

  if (response.isEmpty) return [];
  templates.forEach((frenchTemplate) {
    cmt = 0;
    responseArray.forEach((responseString) {
      frenchTemplate.templates.forEach((templateField) {
        if (checkSimilarity(responseString, templateField) >= 50) cmt++;
      });
    });
    frenchTemplate.percentage = (cmt * 100) / frenchTemplate.templates.length;
  });
  dynamic highestPercentageTemplate = getDocumentType(templates);
  if (highestPercentageTemplate.percentage < 30) return [];

  return highestPercentageTemplate.tagList;
}

List<TagsStruct> stringListToTagsStruct(List<String> tags) {
  List<TagsStruct> result = [];
  TagsStruct tag = TagsStruct();
  for (int i = 0; i != tags.length; i++) {
    tag = TagsStruct();
    tag.name = tags[i];
    result.add(tag);
  }
  return result;
}

Future<List<TagsStruct>> getTagsFromOCR(String url) async {
  final recognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File imgFile = File('$tempPath/your_image.jpg');
    await imgFile.writeAsBytes(response.bodyBytes);
    final inputImage = InputImage.fromFile(imgFile);
    final RecognizedText recognizedText =
        await recognizer.processImage(inputImage);
    List<String> tags = getTags(recognizedText.text);
    List<TagsStruct> result = stringListToTagsStruct(tags);
    return result;
  } else {
    throw Exception('Failed to load image');
  }
}
