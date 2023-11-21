import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../models/homescreen/finished_matches_model.dart';
import '../models/homescreen/live_matches_model.dart';
import '../utils/app_constants.dart';

class AuthProvider extends ChangeNotifier{

  LiveMatchesModel liveMatchesModel=LiveMatchesModel();

  FinishedMatchesModel finishedMatchesModel=FinishedMatchesModel();




  Future<LiveMatchesModel> loginSubmit() async {

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse(AppConstants.livematches),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        liveMatchesModel = LiveMatchesModel.fromJson(decodedJson);

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
    return liveMatchesModel;
  }


  Future<FinishedMatchesModel> getFinishedMatchInfo() async {

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse(AppConstants.finishedMatches),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        finishedMatchesModel = FinishedMatchesModel.fromJson(decodedJson);

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
    return finishedMatchesModel;
  }


}