import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth/login_model.dart';
import '../models/auth/login_otp_model.dart';
import '../models/homescreen/finished_matches_model.dart';
import '../models/homescreen/live_matches_model.dart';
import '../utils/app_constants.dart';

class AuthProvider extends ChangeNotifier{

  LoginModel loginModel=LoginModel();

  LoginOtpModel loginOtpModel=LoginOtpModel();




  Future<LoginModel> loginSubmit(String mobileNo, BuildContext context) async {
    var body = json.encode({
      "mobile_no":mobileNo
    });
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.post(
        Uri.parse(AppConstants.login),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer $accToken',
        },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(decodedJson);

        notifyListeners();
      } else {
        throw const HttpException('Failed to load data');
      }
    } on SocketException {
      print('No internet connection');
    } on HttpException {
      print('Failed to load data');
    } on FormatException {
      print('All Matches  - Invalid data format');
    } catch (e) {
      print(e);
    }
    return loginModel;
  }


  Future<LoginOtpModel> loginOtpCheck(String otp, String userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     //String? accToken = preferences.getString("access_token");
    var body = json.encode({
      "user_id":userId,
      "otp":otp,
      "device_token":"ABCD"
    });

    try {
      final response = await http.post(
        body:body,
        Uri.parse(AppConstants.loginVerification),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer $accToken',
        },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        loginOtpModel = LoginOtpModel.fromJson(decodedJson);

        notifyListeners();
      } else {
        throw const HttpException('Failed to load data');
      }
    } on SocketException {
      print('No internet connection');
    } on HttpException {
      print('Failed to load data');
    } on FormatException {
      print('All Matches  - Invalid data format');
    } catch (e) {
      print(e);
    }
    return loginOtpModel;
  }


}