import 'package:flutter/material.dart';
import 'package:scoring_app/homescreens/playerdetailviewscreen/stats_batting_details.dart';
import 'package:scoring_app/homescreens/playerdetailviewscreen/stats_bowling_details.dart';
import 'package:sizer/sizer.dart';

import '../../models/players/player_stats_model.dart';
import '../../provider/player_details_provider.dart';
import '../../utils/colours.dart';
import '../../utils/sizes.dart';



class PlayerStatsScreen extends StatefulWidget {
  final String playerId;
  const PlayerStatsScreen(this.playerId, {super.key});

  @override
  State<PlayerStatsScreen> createState() => _PlayerStatsScreenState();
}

class _PlayerStatsScreenState extends State<PlayerStatsScreen>with SingleTickerProviderStateMixin {
  late TabController tabController;
  PlayerStatsModel? playerStatsModel;

  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    fetchData();
  }
  fetchData(){
    PlayerDetailsProvider().getPlayerStats(widget.playerId).then((value) {
      setState(() {
        playerStatsModel=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(playerStatsModel==null){
      return const SizedBox(
        height: 100,
        width: 100,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if(playerStatsModel!.data==null){
      return const Center(child: Text('No data found'),);
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68.h,
            padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 4.w),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                color: AppColor.lightColor
            ),
            child: Column(
              children: [
                Center(
                  child: TabBar(
                      labelPadding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 5.w),
                      labelColor: Colors.white,
                      // unselectedLabelColor: AppColor.textColor,
                      // unselectedLabelStyle: TextStyle(
                      //   backgroundColor: Colors.grey, // Background color of inactive tabs
                      // ),
                      isScrollable: true,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.primaryColor
                      ),
                      // dividerColor: Colors.transparent,
                      // labelPadding: EdgeInsets.only
                      //   (bottom: 0.5.h) + EdgeInsets.symmetric(
                      //     horizontal: 4.w
                      // ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      // indicatorColor: AppColor.secondaryColor,
                      controller: tabController,
                      tabs: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.4.h),
                          child: Text('Batting',style: fontMedium.copyWith(fontSize: 12.sp,color: AppColor.blackColour),),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text('Bowling',style: fontMedium.copyWith(fontSize: 12.sp,color: AppColor.blackColour),),
                        ),
                      ]
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      controller: tabController,
                      children:  [
                        StatsBatting(playerStatsModel!.data!.battingPerformance),
                        StatsBowling(playerStatsModel!.data!.bowlingPerformance),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
