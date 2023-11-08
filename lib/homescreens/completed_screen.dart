import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../models/homescreen/finished_matches_model.dart';
import '../provider/matches_list_provider.dart';
import '../utils/colours.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import '../widgets/do_scoring_btn.dart';



class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  final List<Map<String,dynamic>>itemList=[
    {},{},{},
  ];
  FinishedMatchesModel?finishedMatchesModel;
  void initState() {
    // TODO: implement initState
    super.initState();
    apireq();
  }
  apireq(){
    MatchListProvider().getFinishedMatchInfo().then((value) {
      setState(() {
        finishedMatchesModel=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(finishedMatchesModel==null){
      return Center(child: CircularProgressIndicator(),);
    }
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, _) {
          return Padding(
            padding: EdgeInsets.only(bottom: 2.h),
          );
        },
        itemCount:finishedMatchesModel!.data!.length ,
        itemBuilder: (BuildContext, int index) {
          final item = finishedMatchesModel!.data![index];
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
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
                                    SizedBox(width: 3.w,),
                                    Text('${item.teams!.team1Name}',style: fontMedium.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColor.blackColour,
                                    )),

                                    SizedBox(width: 3.w,),
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: ('${item.teamInnings!.first.totalScore}'),
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
                                              text: "${item.teamInnings!.first.totalWickets}",
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: AppColor.pri
                                              )),
                                        ])),
                                    SizedBox(width: 3.w,),
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: '${item.teamInnings!.first.currOvers}',
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff444444)
                                              )),
                                          TextSpan(
                                              text: "/",
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff444444)
                                              )),
                                          TextSpan(
                                              text:  '${item.teamInnings!.first.totalOvers}',
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff444444)
                                              )),
                                        ])),
                                    SizedBox(width: 1.w,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 2.w,top: 1.h),
                                child: Row(
                                  children: [
                                    Image.asset(Images.teamaLogo,width: 10.w,),
                                    SizedBox(width: 3.w,),
                                    Text('${item.teams!.team2Name}',style: fontMedium.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColor.blackColour,
                                    )),
                                    SizedBox(width: 3.w,),
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: '${item.teamInnings![1].totalScore}',
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
                                              text: '${item.teamInnings![1].totalWickets}',
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: AppColor.pri
                                              )),
                                        ])),
                                    SizedBox(width: 3.w,),
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:  '${item.teamInnings![1].currOvers}',
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff444444)
                                              )),
                                          TextSpan(
                                              text: "/",
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff444444)
                                              )),
                                          TextSpan(
                                              text: '${item.teamInnings![1].totalOvers}',
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: Color(0xff444444)
                                              )),
                                        ])),
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
                                dashColor: Color(0xffEFEAEA)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 4.w,top: 1.h),
                                child: Column(
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "${item.teams!.wonTeam} ",
                                              style: fontMedium.copyWith(
                                                fontSize: 13.sp,
                                                color: AppColor.pri,
                                              )),
                                          TextSpan(
                                              text: "${item.teams!.resultDescription?.split(' ')[0]}\n",
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: AppColor.pri
                                              )),
                                          TextSpan(
                                              text: "${item.teams!.resultDescription?.split(' ')[1]} ${item.teams!.resultDescription?.split(' ')[2]} ${item.teams!.resultDescription?.split(' ')[3]}",
                                              style: fontMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: AppColor.blackColour
                                              )),
                                        ])),
                                    // Text("T&T won\nby 9 runs",style: fontRegular.copyWith(
                                    //     fontSize: 12.sp,
                                    //     color: Color(0xff666666)
                                    // ),),
                                  ],
                                ),
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
          );
        });
  }
}
