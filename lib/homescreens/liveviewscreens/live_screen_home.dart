import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';
import 'Scorecard_screens.dart';
import 'commentary_screens/commentary_screen.dart';
import 'info_screen.dart';
import 'live_detail_view_screen.dart';

class LiveScreenHome extends StatefulWidget {
  const LiveScreenHome({super.key});

  @override
  State<LiveScreenHome> createState() => _LiveScreenHomeState();
}

class _LiveScreenHomeState extends State<LiveScreenHome>with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
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
                              "Csk",
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
                              "Csk won the toss \nand choose to bat",
                                // '${matchList!.first.tossWinnerName} won the Toss\nand Choose to ${matchList!.first.choseTo} ',
                                textAlign: TextAlign.center,
                                style: fontRegular.copyWith(
                                    fontSize: 11.sp,
                                    color: AppColor.lightColor
                                )
                            ),
                            Text(
                              "50/3",
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
                                "Overs:1.2/20",
                                // 'Overs: ${matchList!.first.teams!.first.currentOverDetails}/${matchList!.first.overs}',
                                style: fontMedium.copyWith(
                                  fontSize: 11.sp,
                                  color: AppColor.blackColour,
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Text("1st Innings",
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
                              "MI",
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
                  Text('Live',style: fontRegular.copyWith(fontSize: 12.sp,),),
                  Text('Score Card',style: fontRegular.copyWith(fontSize: 12.sp,),),
                  Text('Commentary',style: fontRegular.copyWith(fontSize: 12.sp,),),
                  Text('Info',style: fontRegular.copyWith(fontSize: 12.sp,),),
                ]
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children:  [
                  LiveDetailViewScreen(),
                  ScoreCardScreens(),
                  CommentaryScreen(),
                  InfoScreen(),
                ]),
          )
        ],
      ),
    );
  }
}