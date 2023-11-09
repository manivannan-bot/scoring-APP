import 'package:flutter/material.dart';
import 'package:scoring_app/provider/scoring_provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/players/match_players_model.dart';
import '../../utils/colours.dart';
import '../../utils/sizes.dart';
import 'commentary_screens/teamone_playing_list.dart';
import 'commentary_screens/teamtwo_playing_list.dart';



class PlayingElevenListScreen extends StatefulWidget {
  final String matchId;
  final String team1Id;
  final String team2Id;
  const PlayingElevenListScreen(this.matchId,this.team1Id,this.team2Id,{super.key});

  @override
  State<PlayingElevenListScreen> createState() => _PlayingElevenListScreenState();
}

class _PlayingElevenListScreenState extends State<PlayingElevenListScreen>with SingleTickerProviderStateMixin {
  late TabController tabController;
  MatchPlayersModel? matchPlayers1;
  MatchPlayersModel? matchPlayers2;
  List<PlayersDetails>? playersDetails1;
  List<PlayersDetails>? playersDetails2;

  void initState() {

    super.initState();
    tabController = TabController(length: 2, vsync: this);
    fetchData();
  }

  fetchData()async{
    ScoringProvider().getMatchPlayers(widget.matchId,widget.team1Id).then((value) {
      setState(() {
        matchPlayers1=value;
        playersDetails1=value.data!.playersDetails;
      });
    });

    ScoringProvider().getMatchPlayers(widget.matchId,widget.team2Id).then((value) {
      setState(() {
        matchPlayers2=value;
        playersDetails2=value.data!.playersDetails;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //|| matchPlayers1!.data==null||matchPlayers2!.data==null
    if(playersDetails1==null || playersDetails2==null ){
      return const SizedBox(
          height: 100,
          width: 100,
          child: Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )));
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,size: 7.w,)),
                  Text("Playing XI",style: fontMedium.copyWith(
                    fontSize: 17.sp,
                    color: AppColor.blackColour,
                  ),),
                  SizedBox(width: 7.w,),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            TabBar(
              unselectedLabelColor: AppColor.unselectedTabColor,
              labelColor:  Color(0xffD78108),
              indicatorColor: Color(0xffD78108),
              isScrollable: true,
              controller: tabController,
              indicatorWeight: 4.0, // Set the indicator weight
              tabs: [
                Text('${matchPlayers1!.data!.teams!.first.team1Name}',style: fontRegular.copyWith(fontSize: 14.sp,),),
                Text('${matchPlayers1!.data!.teams!.first.team2Name}',style: fontRegular.copyWith(fontSize: 14.sp,),),
              ],
            ),
            Divider(),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [
                    TeamOnePlayingList(playersDetails1!),
                    TeamTwoPlayingList(playersDetails2!),
                  ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}
