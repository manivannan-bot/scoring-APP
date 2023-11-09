import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scoring_app/homescreens/liveviewscreens/Scorecard_screens.dart';
import '../models/ScoreCard/score_card_response_model.dart';
import '../models/ScoreCard/yet_to_bat.dart';
import '../models/commentary/commentary_four_six_model.dart';
import '../models/commentary/commentary_overs_model.dart';
import '../models/commentary/commentary_wicket_model.dart';
import '../models/homescreen/live_matches_model.dart';
import '../utils/app_constants.dart';

class ScoringProvider extends ChangeNotifier{

  LiveMatchesModel liveMatchesModel=LiveMatchesModel();
  ScoreCardResponseModel scoreCardResponseModel=ScoreCardResponseModel();
  ScoreCardYetTobat scoreCardYetTobat=ScoreCardYetTobat();
  CommentaryOversModel commentaryOversModel=CommentaryOversModel();
  CommentaryWicketModel commentaryWicketModel=CommentaryWicketModel();
  CommentaryFourSixModel commentaryFourSixModel=CommentaryFourSixModel();

  Future<ScoreCardResponseModel> getScoreCard(String matchId,String teamId) async {

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.scoreCardDetails}/$matchId/$teamId'),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        scoreCardResponseModel = ScoreCardResponseModel.fromJson(decodedJson);

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
    return scoreCardResponseModel;
  }
  Future<ScoreCardYetTobat> playersYetToBat(String matchId,String teamId) async {

    try {
      final response = await http.get(
        Uri.parse('${AppConstants.yetTobat}/$matchId/$teamId'),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        scoreCardYetTobat = ScoreCardYetTobat.fromJson(decodedJson);

        notifyListeners();
      } else {
        throw const HttpException('Failed to load data');
      }
    } on SocketException {
      print('No internet connection');
    } on HttpException {
      print('Failed to load data');
    } on FormatException {
      print('yet to bat players  - Invalid data format');
    } catch (e) {
      print(e);
    }
    return scoreCardYetTobat;
  }

  Future<CommentaryOversModel> getCommentaryOvers(String matchId,String teamId) async {

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.commentaryOvers}/$matchId/$teamId'),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        commentaryOversModel = CommentaryOversModel.fromJson(decodedJson);

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
    return commentaryOversModel;
  }
  Future<CommentaryWicketModel> getCommentaryWickets(String matchId,String teamId) async {

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.commentaryWickets}/$matchId/$teamId'),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        commentaryWicketModel = CommentaryWicketModel.fromJson(decodedJson);

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
    return commentaryWicketModel;
  }

  Future<CommentaryFourSixModel> getCommentaryFoursSixes(String matchId,String teamId) async {

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.commentaryFoursSixes}/$matchId/$teamId'),
        // headers: {
        //   // 'Content-Type': 'application/json; charset=UTF-8',
        //   // 'Authorization': 'Bearer $accToken',
        // },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        commentaryFourSixModel = CommentaryFourSixModel.fromJson(decodedJson);

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
    return commentaryFourSixModel;
  }


}
