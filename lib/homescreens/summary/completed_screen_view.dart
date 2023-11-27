import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scoring_app/homescreens/summary/summary_screen.dart';
import 'package:scoring_app/provider/matches_list_provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/ScoreCard/score_card_top_model.dart';
import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';
import '../liveviewscreens/Scorecard_screens.dart';
import '../liveviewscreens/commentary_screens/commentary_screen.dart';
import '../liveviewscreens/info_screen.dart';
import '../liveviewscreens/live_detail_view_screen.dart';


class CompletedScreenView extends StatefulWidget {


  const CompletedScreenView({super.key});

  @override
  State<CompletedScreenView> createState() => _CompletedScreenViewState();
}

class _CompletedScreenViewState extends State<CompletedScreenView>with SingleTickerProviderStateMixin {
  late TabController tabController;
  // ScoreCardTopModel? scoreCardTopModel;
  // RefreshController refreshController=RefreshController();
  // int batTeamId=0;
  // int bowlTeamId=0;
  // int currentInning=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    // fetchData();
  }
  // fetchData(){
  //   MatchListProvider().getScoreCardTop(widget.matchId, widget.teamId).then((value) {
  //     setState(() {
  //       scoreCardTopModel=value;
  //       currentInning=value.matches!.currentInnings;
  //       if(value.matches!.currentInnings==1) {
  //         if (value.matches!.team1Id == value.matches!.tossWonBy &&
  //             value.matches!.choseTo == "Bat") {
  //           batTeamId = value.matches!.team1Id;
  //           bowlTeamId = value.matches!.team2Id;
  //         } else {
  //           bowlTeamId = value.matches!.team1Id;
  //           batTeamId = value.matches!.team2Id;
  //         }
  //       }else if(value.matches!.currentInnings==2 || value.matches!.currentInnings==3){
  //         if (value.matches!.team1Id == value.matches!.tossWonBy &&
  //             value.matches!.choseTo == "Bat") {
  //           bowlTeamId= value.matches!.team1Id;
  //           batTeamId= value.matches!.team2Id;
  //         } else {
  //           batTeamId= value.matches!.team1Id;
  //           bowlTeamId= value.matches!.team2Id;
  //         }
  //
  //       }
  //     });
  //     refreshController.refreshCompleted();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // if(scoreCardTopModel==null){
    //   return Center(child: CircularProgressIndicator(),);
    // }
    return Scaffold(
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
                              "Dhoni CC",
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
                                " Dhoni CC won \n by 4 wickets",
                                // '${matchList!.first.tossWinnerName} won the Toss\nand Choose to ${matchList!.first.choseTo} ',
                                textAlign: TextAlign.center,
                                style: fontRegular.copyWith(
                                    fontSize: 11.sp,
                                    color: AppColor.lightColor
                                )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(Images.teamaLogo,width: 20.w,),
                            Text(
                                "Spartans",
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
          Padding(
            padding:  EdgeInsets.only(bottom: 2.h,),
            child: TabBar(
                unselectedLabelColor: AppColor.unselectedTabColor,
                labelColor:  const Color(0xffD78108),
                indicatorColor: const Color(0xffD78108),
                isScrollable: true,
                indicatorWeight: 2.0,
                labelPadding: EdgeInsets.symmetric(vertical: 0.4.h, horizontal: 3.5.w),
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                tabs: [
                  Text('Summary',style: fontRegular.copyWith(fontSize: 12.sp,),),
                  Text('Score Card',style: fontRegular.copyWith(fontSize: 12.sp,),),
                  Text('Commentary',style: fontRegular.copyWith(fontSize: 12.sp,),),
                  Text('Info',style: fontRegular.copyWith(fontSize: 12.sp,),),
                ]
            ),
          ),
          Container(
            height: 10.h,
            color: AppColor.pri,
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children:  [
                  SummaryScreen(),
                  Container(),
                  Container(),
                  Container(),
                ]),
          )
        ],
      ),
    );
  }
}
