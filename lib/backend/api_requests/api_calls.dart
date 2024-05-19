import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Stripe API Group Code

class StripeAPIGroup {
  static String getBaseUrl() => 'https://api.stripe.com/v1/';
  static Map<String, String> headers = {};
  static CreatePaymentLinkCall createPaymentLinkCall = CreatePaymentLinkCall();
}

class CreatePaymentLinkCall {
  Future<ApiCallResponse> call({
    String? successfulUrl = '',
    String? cancelUrl = '',
    String? priceId = '',
    String? mode = 'subscription',
    String? key = '',
  }) async {
    final baseUrl = StripeAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Create Payment Link',
      apiUrl: '${baseUrl}checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {
        'payment_method_types[]': "card",
        'line_items[][price]': priceId,
        'line_items[][quantity]': 1,
        'success_url': successfulUrl,
        'cancel_url': cancelUrl,
        'mode': mode,
        'allow_promotion_codes': true,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Stripe API Group Code

/// Start Feedback Group Code

class FeedbackGroup {
  static String getBaseUrl() => 'https://formspree.io/';
  static Map<String, String> headers = {};
  static BugReportCall bugReportCall = BugReportCall();
}

class BugReportCall {
  Future<ApiCallResponse> call({
    String? userMail = '',
    String? title = '',
    String? description = '',
    String? steps = '',
    bool? wantsFollowUp,
    String? priority = '',
    String? userPlatform = '',
  }) async {
    final baseUrl = FeedbackGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userMail": "${userMail}",
  "title": "${title}",
  "description": "${description}",
  "steps": "${steps}",
  "wantsFollowUp": ${wantsFollowUp},
  "priority": "${priority}",
  "platform": "${userPlatform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bug report',
      apiUrl: '${baseUrl}f/xjvqvpza',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Feedback Group Code

class SendFeedbackCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? usermail = '',
    String? userid = '',
    int? easeofuse,
    int? bugfree,
    int? price,
    int? quality,
    bool? premium,
    String? feedback = '',
    String? reasonnopremium = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "email": "${usermail}",
  "user id": "${userid}",
  "ease of use rating": "${easeofuse}/5",
  "bug free rating": "${bugfree}/5",
  "features rating": "${quality}/5",
  "price rating": "${price}/5",
  "feedback": "${feedback}",
  "has considered premium?": ${premium},
  "reason why not considered premium": "${reasonnopremium}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send feedback',
      apiUrl: 'https://formspree.io/f/xjvqbazj',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AlogliaSearchCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "filters": "owner:'users/${userId}'",
  "facetFilters": [],
  "optionalFilters": [],
  "numericFilters": [],
  "tagFilters": [],
  "query": "${query}",
  "hitsPerPage": 5
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Aloglia search',
      apiUrl: 'https://eld5f2vq4j.algolia.net/1/indexes/sleeq/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Api-Key': '85f7b7fcaadd9378c0e743c3d9006b56',
        'X-Algolia-Application-Id': 'ELD5F2VQ4J',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CovidCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
${text}''';
    return ApiManager.instance.makeApiCall(
      callName: 'COVID',
      apiUrl: 'https://app.getcovidpass.eu/cert',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
