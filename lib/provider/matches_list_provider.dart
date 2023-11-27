





import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ScoreCard/match_info_model.dart';
import '../models/ScoreCard/live_scorecard_model.dart';
import '../models/ScoreCard/score_card_response_model.dart';
import '../models/ScoreCard/score_card_top_model.dart';
import '../models/commentary/commentary_four_six_model.dart';
import '../models/commentary/commentary_overs_model.dart';
import '../models/commentary/commentary_wicket_model.dart';
import '../models/homescreen/finished_matches_model.dart';
import '../models/homescreen/live_matches_model.dart';
import '../utils/app_constants.dart';

class MatchListProvider extends ChangeNotifier{

  LiveMatchesModel liveMatchesModel=LiveMatchesModel();

  FinishedMatchesModel finishedMatchesModel=FinishedMatchesModel();

  ScoreCardResponseModel scoreCardModel=ScoreCardResponseModel();
  MatchInfoModel matchInfoModel=MatchInfoModel();
  CommentaryOversModel commentaryOversModel=CommentaryOversModel();
  CommentaryWicketModel commentaryWicketModel=CommentaryWicketModel();
  CommentaryFourSixModel commentaryFoursSixesModel =CommentaryFourSixModel();


  Future<LiveMatchesModel> getMatchInfo() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse(AppConstants.livematches),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accToken',
        },
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

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse(AppConstants.finishedMatches),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accToken',
        },
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

//scorecardmodel
  Future<ScoreCardResponseModel> getScoreCard(String matchId, String teamId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.scoreCardDetails}/$matchId/$teamId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accToken',
        },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        scoreCardModel = ScoreCardResponseModel.fromJson(decodedJson);

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
    return scoreCardModel;
  }


  ScoreCardTopModel scoreCardTopModel=ScoreCardTopModel();
//scorecardtop
  Future<ScoreCardTopModel> getScoreCardTop(String matchId,String teamId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.scoreCardTop}/$matchId/$teamId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accToken',
        },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        scoreCardTopModel = ScoreCardTopModel.fromJson(decodedJson);

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
    return scoreCardTopModel;
  }
  Future<MatchInfoModel> getMatchInformation(String matchId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.matchInfo}/$matchId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accToken',
        },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        matchInfoModel = MatchInfoModel.fromJson(decodedJson);

        notifyListeners();
      } else {
        throw const HttpException('Failed to load data');
      }
    } on SocketException {
      print('No internet connection');
    } on HttpException {
      print('Failed to load data');
    } on FormatException {
      print('matchInformation - Invalid data format');
    } catch (e) {
      print(e);
    }
    return matchInfoModel;
  }

//liveScorecard

  LiveScoreCardModel liveScoreCardModel=LiveScoreCardModel();

  Future<LiveScoreCardModel> getScoreCardLive(String matchId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accToken = preferences.getString("access_token");
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.getLiveScoreCard}/$matchId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accToken',
        },
      );
      var decodedJson = json.decode(response.body);
      print(decodedJson);
      if (response.statusCode == 200) {
        liveScoreCardModel = LiveScoreCardModel.fromJson(decodedJson);

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
    return liveScoreCardModel;
  }
}
