import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoring_app/provider/matches_list_provider.dart';
import 'package:sizer/sizer.dart';

import '../models/homescreen/live_matches_model.dart';
import '../utils/colours.dart';
import '../utils/images.dart';
import '../utils/sizes.dart';
import '../widgets/do_scoring_btn.dart';
import 'liveviewscreens/live_screen_home.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final List<Map<String,dynamic>>itemList=[
    {},{},{},{},{},{},{},{},{},{},{},{},
  ];
  LiveMatchesModel? liveMatchesModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apireq();
  }
  apireq(){
    MatchListProvider().getMatchInfo().then((value) {
      setState(() {
        liveMatchesModel=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if(liveMatchesModel==null || liveMatchesModel!.matches!.isEmpty){
      return Center(child: CircularProgressIndicator(),);
    }
    return (liveMatchesModel!.matches!.isNotEmpty)?ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, _) {
          return Padding(
            padding: EdgeInsets.only(bottom: 2.h),
          );
        },
        itemCount:liveMatchesModel!.matches!.length ,
        itemBuilder: (context, int index) {
          final item = liveMatchesModel!.matches![index];
          return GestureDetector(
            onTap: (){
              if(item.currentInnings==1){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    LiveScreenHome(item.matchId.toString(),item.team1Id.toString())));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    LiveScreenHome(item.matchId.toString(),item.team2Id.toString())));
              }

            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.lightColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 2.w,top: 1.h),
                                  child: Row(
                                    children: [
                                      Image.asset(Images.teamaLogo,width: 10.w,),
                                      SizedBox(width: 2.w,),
                                      Text(
                                          "${item!.team1Name}",
                                          style: fontMedium.copyWith(
                                            fontSize: 13.sp,
                                            color: AppColor.pri,
                                          )
                                      ),
                                      SizedBox(width: 2.w,),
                                      RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "${item.teams!.first.totalRuns}",
                                                style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: AppColor.pri,
                                                )),
                                            TextSpan(
                                                text: "/",
                                                style: fontMedium.copyWith(
                                                    fontSize: 13.sp,
                                                    color: AppColor.pri
                                                )),
                                            TextSpan(
                                                 text:"${item.teams!.first.totalWickets}",
                                                 // ("${matchList![index].teams!.first.totalWickets??''}"),
                                                style: fontMedium.copyWith(
                                                    fontSize: 13.sp,
                                                    color: AppColor.pri
                                                )),
                                          ])),
                                      SizedBox(width: 2.w,),
                                      RichText(text: TextSpan(children: [
                                        TextSpan(
                                          text:"${item.teams!.first.currentOverDetails}",
                                            // text: ("${matchList![index].teams!.first.overNumber??''}.${matchList![index].teams!.first.ballNumber??''}"),
                                            style: fontMedium.copyWith(
                                                fontSize: 13.sp,
                                                color: const Color(0xff444444)
                                            )),
                                        TextSpan(
                                            text: "/",
                                            style: fontMedium.copyWith(
                                                fontSize: 13.sp,
                                                color: const Color(0xff444444)
                                            )),
                                        TextSpan(
                                            text:"${item.overs}",
                                            // text: matchList![index].overs,
                                            style: fontMedium.copyWith(
                                                fontSize: 13.sp,
                                                color: const Color(0xff444444)
                                            )),
                                      ])),
                                      SizedBox(width: 1.w,),
                                      (item!.currentInnings==1)?SvgPicture.asset(Images.batIcon,width: 5.w,):Text(""),
                                      // if(matchList![index].currentInnings==1)...[
                                      //   SvgPicture.asset(Images.batIcon,width: 5.w,)
                                      // ] else ...[
                                      //   const SizedBox()
                                      // ],
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.w,top: 1.h),
                                  child: Row(
                                    children: [
                                      Image.asset(Images.teamblogo,width: 10.w,fit: BoxFit.fill,),
                                      SizedBox(width: 2.w,),
                                      Text(
                                          "${item!.team2Name}",
                                          style: fontMedium.copyWith(
                                            fontSize: 13.sp,
                                            color: AppColor.pri,
                                          )
                                      ),
                                      SizedBox(width: 2.w,),
                                      (item!.currentInnings==1)?Text("Yet to bat", style: fontRegular.copyWith(
                                        fontSize: 12.sp,
                                        color:const Color(0xff666666),
                                      ),):Row(
                                        children: [
                                          RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "${item.teams![1].totalRuns}",
                                                    style: fontMedium.copyWith(
                                                      fontSize: 13.sp,
                                                      color: AppColor.pri,
                                                    )),
                                                TextSpan(
                                                    text: "/",
                                                    style: fontMedium.copyWith(
                                                        fontSize: 13.sp,
                                                        color: AppColor.pri
                                                    )),
                                                TextSpan(
                                                    text:"${item.teams![1].totalWickets}",
                                                    // ("${matchList![index].teams!.first.totalWickets??''}"),
                                                    style: fontMedium.copyWith(
                                                        fontSize: 13.sp,
                                                        color: AppColor.pri
                                                    )),
                                              ])),
                                          SizedBox(width: 2.w,),
                                          RichText(text: TextSpan(children: [
                                            TextSpan(
                                                text:"${item.teams![1].currentOverDetails}",
                                                // text: ("${matchList![index].teams!.first.overNumber??''}.${matchList![index].teams!.first.ballNumber??''}"),
                                                style: fontMedium.copyWith(
                                                    fontSize: 13.sp,
                                                    color: const Color(0xff444444)
                                                )),
                                            TextSpan(
                                                text: "/",
                                                style: fontMedium.copyWith(
                                                    fontSize: 13.sp,
                                                    color: const Color(0xff444444)
                                                )),
                                            TextSpan(
                                                text:"${item.overs}",
                                                // text: matchList![index].overs,
                                                style: fontMedium.copyWith(
                                                    fontSize: 13.sp,
                                                    color: const Color(0xff444444)
                                                )),
                                          ])),
                                          SizedBox(width: 1.w,),
                                          SvgPicture.asset(Images.batIcon,width: 5.w,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 2.h),
                              child: Dash(
                                  direction: Axis.vertical,
                                  length: 6.h,
                                  dashGap: 1,
                                  dashLength: 5,
                                  dashColor: const Color(0xffEFEAEA)),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 0.8.h
                              ),
                              decoration:  BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(Images.liveIcon,width: 2.5.w,),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text("Live",style: fontRegular.copyWith(
                                    fontSize: 10.5.sp,
                                    color: const Color(0xff444444),
                                  ),)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        const DottedLine(
                          dashColor: Color(0xffD2D2D2),
                        ),
                        SizedBox(height: 1.h,),
                        //toss line
                        Padding(
                          padding:  EdgeInsets.only(left: 2.w,bottom: 1.h),
                          child: Text(
                            "${item!.tossWinnerName} won the toss choose to ${item!.choseTo}"
                            ,style: fontRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppColor.pri
                          ),),
                          // child: Text('${matchList![index].tossWinnerName} won the toss choose to ${matchList![index].choseTo}',style: fontRegular.copyWith(
                          //     fontSize: 12.sp,
                          //     color: AppColor.pri
                          // ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }):Text(' No matches found');
  }
}
