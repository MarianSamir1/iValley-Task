import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ivally_task/utilities/constants/constatnts.dart';
import 'package:ivally_task/utilities/constants/end_points.dart';

import '../../../model/response_handler_model.dart';

class HttpHelper {
  //Post
  static Future<ResponseHandlerClass> postData({
    required String functionName,
    required String path,
    Map<String, dynamic>? body,
  }) async {
    log("Post URL ${EndPoints.baseUrl + path}");
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      var response = await http
          .post(
            Uri.parse(EndPoints.baseUrl + path),
            body: jsonEncode(body ?? {}),
            headers: headers,
          )
          .timeout(const Duration(seconds: 60));
      log("========== $functionName statusCode : ${response.statusCode} ========");
      log("========== $functionName response : ${jsonDecode(response.body)} ========");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(
          errorMessage: "Success",
          values: jsonDecode(response.body),
        );
      } else {
        log('send but filed Exception');
        return ResponseHandlerClass(
          errorFlag: true,
          errorMessage: Constants.somethingWentWrong,
        );
      }
    } on TimeoutException {
      log('Time out Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.timeoutException,
      );
    } on SocketException {
      log('Socket Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.internetConnectionException,
      );
    } catch (e) {
      log(' ========== http post Data $path throw Exeption : $e ==========');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.somethingWentWrong,
      );
    }
  }

  //Get
  static Future<ResponseHandlerClass> getData({
    required String functionName,
    required String path,
    required String token,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      var response = await http
          .get(
            Uri.parse(EndPoints.baseUrl + path),
            headers: headers,
          )
          .timeout(const Duration(seconds: 60));
      log("========== $functionName statusCode : ${response.statusCode} ========");
      log("========== $functionName response : ${jsonDecode(response.body)} ========");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(
          errorMessage: "Success",
          values: jsonDecode(response.body),
        );
      } else {
        log('send but filed Exception');
        return ResponseHandlerClass(
          errorFlag: true,
          errorMessage: Constants.somethingWentWrong,
        );
      }
    } on TimeoutException {
      log('Time out Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.timeoutException,
      );
    } on SocketException {
      log('Socket Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.internetConnectionException,
      );
    } catch (e) {
      log(' ========== http get Data $path throw Exeption : $e ==========');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.somethingWentWrong,
      );
    }
  }

  //Put
  static Future<ResponseHandlerClass> putData({
    required String functionName,
    required String path,
    Map<String, dynamic>? body,
    required String token,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      var response = await http
          .put(
            Uri.parse(EndPoints.baseUrl + path),
            body: jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: 60));
      log("========== $functionName statusCode : ${response.statusCode} ========");
      log("========== $functionName response : ${jsonDecode(response.body)} ========");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(
          errorMessage: "Success",
          values: jsonDecode(response.body),
        );
      } else {
        log('send but filed Exception');
        return ResponseHandlerClass(
          errorFlag: true,
          errorMessage: Constants.somethingWentWrong,
        );
      }
    } on TimeoutException {
      log('Time out Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.timeoutException,
      );
    } on SocketException {
      log('Socket Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.internetConnectionException,
      );
    } catch (e) {
      log(' ========== http put Data $path throw Exeption : $e ==========');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.somethingWentWrong,
      );
    }
  }

  //Patch
  static patchData({
    required String functionName,
    required String path,
    required Map<String, dynamic> body,
    required String token,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      var response = await http
          .patch(
            Uri.parse(EndPoints.baseUrl + path),
            body: jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: 60));
      log("========== $functionName statusCode : ${response.statusCode} ========");
      log("========== $functionName response : ${jsonDecode(response.body)} ========");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(
          errorMessage: "Success",
          values: jsonDecode(response.body),
        );
      } else {
        log('send but filed Exception');
        return ResponseHandlerClass(
          errorFlag: true,
          errorMessage: Constants.somethingWentWrong,
        );
      }
    } on TimeoutException {
      log('Time out Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.timeoutException,
      );
    } on SocketException {
      log('Socket Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.internetConnectionException,
      );
    } catch (e) {
      log(' ========== http patch Data $path throw Exeption : $e ==========');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.somethingWentWrong,
      );
    }
  }

  //Delete
  static deleteData({
    required String functionName,
    required String path,
    required String token,
    String? errorTitle,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      var response = await http
          .delete(
            Uri.parse(EndPoints.baseUrl + path),
            headers: headers,
          )
          .timeout(const Duration(seconds: 60));
      log("========== $functionName statusCode : ${response.statusCode} ========");

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return ResponseHandlerClass(errorMessage: "Success");
      } else {
        log('send but filed Exception');
        return ResponseHandlerClass(
          errorFlag: true,
          errorMessage: Constants.somethingWentWrong,
        );
      }
    } on TimeoutException {
      log('Time out Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.timeoutException,
      );
    } on SocketException {
      log('Socket Exception');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.internetConnectionException,
      );
    } catch (e) {
      log(' ========== http delete Data $path throw Exeption : $e ==========');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: Constants.somethingWentWrong,
      );
    }
  }
}
