import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scoring_app/provider/matches_list_provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/ScoreCard/score_card_top_model.dart';
import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';
import 'Scorecard_screens.dart';
import 'commentary_screens/commentary_screen.dart';
import 'info_screen.dart';
import 'live_detail_view_screen.dart';

class LiveScreenHome extends StatefulWidget {
  final String matchId;
  final String teamId;

  const LiveScreenHome(this.matchId, this.teamId, {super.key});

  @override
  State<LiveScreenHome> createState() => _LiveScreenHomeState();
}

class _LiveScreenHomeState extends State<LiveScreenHome>with SingleTickerProviderStateMixin {
  late TabController tabController;
  ScoreCardTopModel? scoreCardTopModel;
  RefreshController refreshController=RefreshController();
  int batTeamId=0;
  int bowlTeamId=0;
  int currentInning=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    fetchData();
  }
  fetchData(){
    MatchListProvider().getScoreCardTop(widget.matchId, widget.teamId).then((value) {
      setState(() {
        scoreCardTopModel=value;
        currentInning=value.matches!.currentInnings;
        if(value.matches!.currentInnings==1) {
          if (value.matches!.team1Id == value.matches!.tossWonBy &&
              value.matches!.choseTo == "Bat") {
            batTeamId = value.matches!.team1Id;
            bowlTeamId = value.matches!.team2Id;
          } else {
            bowlTeamId = value.matches!.team1Id;
            batTeamId = value.matches!.team2Id;
          }
        }else if(value.matches!.currentInnings==2 || value.matches!.currentInnings==3){
          if (value.matches!.team1Id == value.matches!.tossWonBy &&
              value.matches!.choseTo == "Bat") {
             bowlTeamId= value.matches!.team1Id;
             batTeamId= value.matches!.team2Id;
          } else {
             batTeamId= value.matches!.team1Id;
             bowlTeamId= value.matches!.team2Id;
          }

        }
      });
      refreshController.refreshCompleted();
    });
  }
  @override
  Widget build(BuildContext context) {
    if(scoreCardTopModel==null){
      return Center(child: CircularProgressIndicator(),);
    }
    return SmartRefresher(
      enablePullDown: true,
      controller:refreshController ,
      onRefresh: fetchData,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                // Background image
                Image.asset(
                  Images.bannerBg,
                  fit: BoxFit.cover, // You can choose how the image should be scaled
                  width: double.infinity,
                  height: 30.h,
                ),
                Positioned(
                  top: 5.h,
                  left: 5.w,
                  right: 5.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap:(){
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const HomeScreen()));
                              },
                              child: Icon(Icons.arrow_back,color: AppColor.lightColor, size: 7.w,)),
                          Text(
                              'Team',
                              style: fontMedium.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColor.lightColor
                              )
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(Images.teamaLogo,width: 20.w,),
                              Text(
                                "${scoreCardTopModel!.matches!.team1Name}",
                                // '${matchList!.first.team1Name}',
                                style: fontMedium.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColor.lightColor
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${scoreCardTopModel!.matches!.tossWinnerName} won the toss \nand choose to ${scoreCardTopModel!.matches!.choseTo} ",
                                  // '${matchList!.first.tossWinnerName} won the Toss\nand Choose to ${matchList!.first.choseTo} ',
                                  textAlign: TextAlign.center,
                                  style: fontRegular.copyWith(
                                      fontSize: 11.sp,
                                      color: AppColor.lightColor
                                  )
                              ),
                              Text(
                                "${scoreCardTopModel!.matches!.teams!.totalRuns}/${scoreCardTopModel!.matches!.teams!.totalWickets}"
                                ,
                                  // '${matchList!.first.teams!.first.totalRuns}/${matchList!.first.teams!.first.totalWickets}',
                                  style: fontMedium.copyWith(
                                      fontSize: 25.sp,
                                      color: AppColor.lightColor
                                  )),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.8.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.primaryColor,
                                ),
                                child: Text(
                                  "Overs:${scoreCardTopModel!.matches!.teams!.currentOverDetails}/${scoreCardTopModel!.matches!.overs}",
                                  // 'Overs: ${matchList!.first.teams!.first.currentOverDetails}/${matchList!.first.overs}',
                                  style: fontMedium.copyWith(
                                    fontSize: 11.sp,
                                    color: AppColor.blackColour,
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Text("${scoreCardTopModel!.matches!.currentInnings}st Innings",
                                // "Innings ${matchList!.first.currentInnings??'0'}",
                                style: fontRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.lightColor,
                                ),)
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(Images.teamaLogo,width: 20.w,),
                              Text(
                                "${scoreCardTopModel!.matches!.team2Name}",
                                  // '${matchList!.first.team2Name}',
                                  style:fontMedium.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColor.lightColor)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h,),
            TabBar(
                unselectedLabelColor: AppColor.unselectedTabColor,
                labelColor:  const Color(0xffD78108),
                indicatorColor: const Color(0xffD78108),
                isScrollable: true,
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: fontMedium.copyWith(
                    fontSize: 12.sp
                ),
                unselectedLabelStyle: fontRegular.copyWith(
                    fontSize: 12.sp
                ),
                controller: tabController,
                tabs: [
                  Tab(
                    text: "Live",
                  ),
                  Tab(
                    text: "Score Card",
                  ),
                  Tab(
                    text: "Commentary",
                  ),
                  Tab(
                    text: "Info",
                  ),
                ]
            ),
            Theme(
                data: ThemeData(
                  dividerTheme: const DividerThemeData(
                    space: 0, // Set space to 0 to remove top and bottom padding
                    thickness: 0.5, // Set thickness to desired value
                    indent: 0, // Set indent to desired value
                    endIndent: 0, // Set endIndent to desired value
                  ),
                ),
                child: const Divider()),
            SizedBox(height: 2.h,),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children:  [
                    LiveDetailViewScreen(widget.matchId),
                    ScorecardScreen(widget.matchId,batTeamId.toString(),bowlTeamId.toString(),currentInning.toString(),fetchData),
                    CommentaryScreen(widget.matchId,batTeamId.toString(),bowlTeamId.toString(),fetchData),
                    InfoScreen(widget.matchId),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
