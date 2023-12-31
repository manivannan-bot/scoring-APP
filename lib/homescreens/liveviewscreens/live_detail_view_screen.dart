import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'package:scoring_app/provider/matches_list_provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/ScoreCard/live_scorecard_model.dart';
import '../../models/ScoreCard/score_card_response_model.dart';
import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';

class LiveDetailViewScreen extends StatefulWidget {
final String matchId;

  const LiveDetailViewScreen(this.matchId,{super.key});

  @override
  State<LiveDetailViewScreen> createState() => _LiveDetailViewScreenState();
}

class _LiveDetailViewScreenState extends State<LiveDetailViewScreen> {
  LiveScoreCardModel? liveScoreCardModel;
  String eventData='No data found';
  @override
  void initState() {
    super.initState();
    MatchListProvider().getScoreCardLive(widget.matchId).then((value) {
      setState(() {
        liveScoreCardModel=value;
      });
    });

    setUpServices();
  }

  void setUpServices() {
    debugPrint('Service_Setup');
    var options = PusherOptions(
        host: '64.227.139.48', port: 6001, encrypted: false, cluster: 'mt1');

    LaravelFlutterPusher pusher =
    LaravelFlutterPusher('app-key', options, enableLogging: true,onConnectionStateChange: (status){ print(status.currentState);});
    pusher.subscribe('public.match.list').bind('.matches', (event){
      setState(() {
        eventData = 'Event Data: ${event?.toString()}';
      });
      debugPrint(eventData);
    });
    pusher.connect(onError: (error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if(liveScoreCardModel==null){
      return const Center(child: CircularProgressIndicator(),);
    }
    if(liveScoreCardModel!.data==null){
      return const Center(child: Text('No score found'));
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: AppColor.blackColour,
          ),
          child: (liveScoreCardModel!.data!.currRunRate!=null)?Row(
            children: [
              Text(
                "CRR : ${liveScoreCardModel!.data!.currRunRate!.runRate}",
                style: fontMedium.copyWith(
                  fontSize: 10.sp,
                  color: AppColor.lightColor,
                ),
              ),
              SizedBox(width: 4.w,),
              (liveScoreCardModel!.data!.teamsName!.first.currentInnings==2)?  Expanded(
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "RRR: ${liveScoreCardModel!.data!.currRunRate!.reqRunRate}",
                      style: fontMedium.copyWith(
                        fontSize: 10.sp,
                        color: AppColor.lightColor,
                      ),
                    ),
                    Text(
                      "Target:${liveScoreCardModel!.data!.currRunRate!.targetScore}",
                      style: fontMedium.copyWith(
                        fontSize: 10.sp,
                        color: AppColor.lightColor,
                      ),
                    ),
                  ],
                ),
              ) : Text('')
            ],
          ) : const SizedBox(),
        ),
        SizedBox(height: 2.h,),
        Text('$eventData'),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              Text(
                "Batting",
                style: fontMedium.copyWith(
                  fontSize: 12.sp,
                  color: AppColor.blackColour,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              SvgPicture.asset(
                Images.batIcon,
                width: 4.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text(
                  "Batsman",
                  style: fontRegular.copyWith(
                    fontSize: 11.sp,
                    color: AppColor.pri,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "R",
                      style: fontRegular.copyWith(
                        fontSize: 11.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "B",
                      style: fontRegular.copyWith(
                        fontSize: 11.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "4s",
                      style: fontRegular.copyWith(
                        fontSize: 11.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "6s",
                      style: fontRegular.copyWith(
                        fontSize: 11.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "SR",
                      style: fontRegular.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xffD3D3D3),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true, // Remove top system padding (status bar)
              removeBottom: true,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, _) {
                    return  Padding(
                      padding: EdgeInsets.only(bottom: 0.5.h),
                      child: const DottedLine(
                        dashColor: Color(0xffD2D2D2),
                      ),
                    );
                  },
                  itemCount: liveScoreCardModel!.data!.batting!.length,
                  itemBuilder: (BuildContext, int index) {
                    final item = liveScoreCardModel!.data!.batting![index];
                    return Row(
                      children: [
                        SizedBox(
                          width: 35.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${item.playerName}",
                             style: fontRegular.copyWith(
                                    fontSize: 11.sp,
                                    color: AppColor.blackColour,
                                  ),),
                                  SizedBox(width: 1.w,),
                                  (item.stricker==1)?SvgPicture.asset(Images.batIcon,width: 4.w,color: AppColor.blackColour,):const SizedBox()
                                ],
                              ),
                              SizedBox(height: 0.5.h,),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "Batting",
                                        style: fontRegular.copyWith(
                                          fontSize: 9.sp,
                                          color: const Color(0xff777777),
                                        )),
                                    // TextSpan(
                                    //     text: "b ${item.wicketBowlerName}",
                                    //     style: fontRegular.copyWith(
                                    //         fontSize: 11.sp,
                                    //         color: const Color(0xff777777)
                                    //     )),
                                  ])),
                              SizedBox(height: 1.h,),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${item.runsScored}",style: fontMedium.copyWith(
                                fontSize: 11.sp,
                                color:AppColor.blackColour,
                              ),),
                              Text("${item.ballsFaced}",style: fontRegular.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("${item.fours}",style: fontRegular.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("${item.sixes}",style: fontRegular.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("${item.strikeRate}",style: fontRegular.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xff777777),
                              ),),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
        const Divider(
          color: Color(0xffD3D3D3),
        ),
        SizedBox(height: 1.h,),
        //bowling
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              Text("Bowling",style: fontMedium.copyWith(
                fontSize: 12.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(width: 1.w,),
              SvgPicture.asset(Images.ballIcon,width: 4.w,),
            ],
          ),
        ),
        SizedBox(height: 1.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text("Bowler",style: fontRegular.copyWith(
                  fontSize: 11.sp,
                  color: AppColor.pri,
                ),),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("O",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("M",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("R",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("W",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("Eco",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xffD3D3D3),
        ),
        (liveScoreCardModel!.data!.bowling !=null)?Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child:Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${liveScoreCardModel!.data!.bowling!.playerName}",
                          // "${item.playerName}",
                          style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: AppColor.blackColour,
                          ),),
                        SizedBox(width: 1.w,),
                        SvgPicture.asset(Images.ballBlackIcon,width: 4.w,color: AppColor.blackColour,)
                      ],
                    ),
                    SizedBox(height: 0.5.h,),
                  ],
                ),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${liveScoreCardModel!.data!.bowling!.overBall}"
                      ,style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text( "${liveScoreCardModel!.data!.bowling!.maiden}",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text( "${liveScoreCardModel!.data!.bowling!.runsConceded}",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text( "${liveScoreCardModel!.data!.bowling!.wickets}",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text( "${liveScoreCardModel!.data!.bowling!.economy}",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ):Text(''),
      ],
    );
  }

}
