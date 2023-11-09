import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:scoring_app/homescreens/liveviewscreens/scorecard_one.dart';
import 'package:scoring_app/homescreens/liveviewscreens/scorecard_two.dart';
import 'package:scoring_app/provider/matches_list_provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/ScoreCard/score_card_response_model.dart';
import '../../models/ScoreCard/score_card_top_model.dart';
import '../../provider/scoring_provider.dart';
import '../../utils/colours.dart';
import '../../utils/sizes.dart';




class ScorecardScreen extends StatefulWidget {
  final String matchId;
  final String team1Id;
  final VoidCallback fetchData;
  const ScorecardScreen(this.matchId,this.team1Id,this.fetchData,{super.key});

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen>with SingleTickerProviderStateMixin{
  late TabController tabController;
  ScoreCardResponseModel?  scoreCardResponseModel;
  Matches? matchlist;
  List<TeamsName>?teams;
  int? batTeamId;
  int? bowlTeamId;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    fetchData();
  }

  void fetchData()async{
    await MatchListProvider().getScoreCardTop(widget.matchId, widget.team1Id).then((data) async{
      if(mounted){
        setState(() {
          matchlist = data.matches;

          if(matchlist!.currentInnings==1){
            if(matchlist!.tossWonBy==int.parse(widget.team1Id) && matchlist!.choseTo=='Bat' ) {
              batTeamId=data.matches!.team1Id;
              bowlTeamId=data.matches!.team2Id;
            }else{
              batTeamId=data.matches!.team2Id;
              bowlTeamId=data.matches!.team1Id;
            }
          }else if(matchlist!.currentInnings==2){
            if(matchlist!.tossWonBy==int.parse(widget.team1Id) && matchlist!.choseTo=='Bat' ) {
              batTeamId=data.matches!.team2Id;
              bowlTeamId=data.matches!.team1Id;
            }else{
              batTeamId=data.matches!.team1Id;
              bowlTeamId=data.matches!.team2Id;
            }
          }
        });
      }
    });

    ScoringProvider().getScoreCard(widget.matchId, widget.team1Id).then((value){
      setState(() {
        scoreCardResponseModel=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(scoreCardResponseModel==null){
      return const SizedBox(
          height: 100,
          width: 100,
          child: Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )));
    }
    if(scoreCardResponseModel!.data==null){
      return const Center(child: Text('No data found'),);
    }
    if(scoreCardResponseModel!=null){
      teams= scoreCardResponseModel!.data!.teamsName;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 6.w),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              color: AppColor.blackColour,
            ),
            child: Row(
                children:[
                  Text("CRR: ${scoreCardResponseModel!.data!.currRunRate!.runRate??'-'}",style: fontMedium.copyWith(
                    fontSize: 10.sp,
                    color: AppColor.lightColor,
                  ),),
                  (teams!.first.currentInnings==2)?Row(children: [
                    SizedBox(width: 2.w,),
                    Text("RRR: ${scoreCardResponseModel!.data!.currRunRate!.reqRunRate??'-'}",style: fontMedium.copyWith(
                      fontSize: 10.sp,
                      color: AppColor.lightColor,
                    ),),
                    SizedBox(width: 40.w,),
                    Text("Target: ${scoreCardResponseModel!.data!.currRunRate!.targetScore??'-'}",style: fontMedium.copyWith(
                      fontSize: 10.sp,
                      color: AppColor.lightColor,
                    ),),],):const Text('')
                ]
            ),
          ),
          SizedBox(height: 1.h,),
          TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 0.1.h,horizontal: 5.w),
              labelColor: Colors.white,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primaryColor
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 04.w,vertical: 0.4.h),
                  child: Text('${teams!.first.team1Name}',style: fontMedium.copyWith(fontSize: 13.sp,color: AppColor.blackColour),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text('${teams!.first.team2Name} ${teams!.first.currentInnings==1?'Yet to bat':teams!.first.team2Name}',style: fontMedium.copyWith(fontSize: 13.sp,color: AppColor.blackColour),),
                ),
              ]
          ),
          SizedBox(height: 1.h,),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children:  [
                  ScoreCardOne(scoreCardResponseModel!.data!),
                  if(teams!.first.currentInnings==1)...[
                    ScoreCardTwo(widget.matchId,bowlTeamId.toString()),]
                  else...[
                    ScoreCardOne(scoreCardResponseModel!.data!),
                  ]

                ]),
          ),
        ],
      ),
    );
  }
}


