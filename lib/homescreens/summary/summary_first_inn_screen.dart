import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';


class SummaryFirstInnScreen extends StatefulWidget {
  const SummaryFirstInnScreen({super.key});

  @override
  State<SummaryFirstInnScreen> createState() => _SummaryFirstInnScreenState();
}

class _SummaryFirstInnScreenState extends State<SummaryFirstInnScreen> {
  final List<Map<String,dynamic>>itemList=[
    {
      "image":'assets/images/req_list.png',
      "name":"Akash",
      "team":"(Toss and Tails)",
      "dot":".",
      "batsman":"Right hand batsman",
      "button":"Connect",
    },
    {
      "image":'assets/images/req_list.png',
      "name":"Vigneswaran",
      "team":"(Royal Kings)",
      "dot":".",
      "batsman":"All rounder",
      "button":"Connect",
    },
    {
      "image":'assets/images/req_list.png',
      "name":"Siva",
      "team":"(Thunder 11'S)",
      "dot":".",
      "batsman":"Left hand batsman",
      "button":"Connect",
    },
    {
      "image":'assets/images/req_list.png',
      "name":"Anbu",
      "team":"(Pitch Damagers)",
      "dot":".",
      "batsman":"Fast bowler",
      "button":"Connect",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.mainBgColor,
            ),
            child: Row(
              children: [
                Text("DCC -",style: fontRegular.copyWith(
                  fontSize: 15.sp,
                  color: Color(0xff555555),
                ),),
                Text("134/6",style: fontMedium.copyWith(
                  fontSize: 17.sp,
                  color: AppColor.blackColour,
                ),),
                Text("(20.0)",style: fontRegular.copyWith(
                  fontSize: 16.sp,
                  color: Color(0xff666666),
                ),),
                Text("1st Innings",style: fontRegular.copyWith(
                  fontSize: 12.sp,
                  color: Color(0xff666666),
                ),),
              ],
            ),
          ),
          Row(
            children: [
              Text("Batting",style: fontMedium.copyWith(
                fontSize: 12.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(width: 1.w,),
              SvgPicture.asset(Images.batIcon,width: 4.w,),
            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text("Batsman",style: fontRegular.copyWith(
                  fontSize: 11.sp,
                  color: AppColor.pri,
                ),),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("R",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("B",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("4s",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("6s",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("SR",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          // (widget.scoreCardData.batting!.isEmpty)?const Text('No data found'):
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, _) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 0.5.h),
                  child: const DottedLine(
                    dashColor: Color(0xffD2D2D2),
                  ),
                );
              },
              itemCount: itemList.length,
              itemBuilder: (context, int index) {
                final item = itemList[index];
                return Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("VijayKumar",style: fontRegular.copyWith(
                                fontSize: 11.sp,
                                color: AppColor.blackColour,
                              ),),
                              SizedBox(width: 1.w,),
                              // (item.isOut!=1 && item.stricker==1)?
                              SvgPicture.asset(Images.batIcon,width: 4.w,color: AppColor.blackColour,)
                                  // :const SizedBox(),
                            ],
                          ),
                          SizedBox(height: 0.5.h,),
                          // (item.isOut==1)?
                          RichText(
                              text: TextSpan(
                                  children: [
                                TextSpan(
                                    text: ("karthi "),
                                    style: fontRegular.copyWith(
                                      fontSize: 9.sp,
                                      color: const Color(0xff777777),
                                    )),
                                TextSpan(
                                    text: "b santhosh",
                                    style: fontRegular.copyWith(
                                        fontSize: 9.sp,
                                        color: const Color(0xff777777)
                                    )),
                              ])),
                              // :Text('Batting',style: fontRegular.copyWith(fontSize: 9.sp,color: const Color(0xff777777)),),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("55",style: fontMedium.copyWith(
                            fontSize: 11.sp,
                            color: AppColor.blackColour,
                          ),),
                          Text("23",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                          Text("7",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                          Text("8",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                          Text("100.0",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                        ],
                      ),
                    ),
                  ],
                );
              }),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text("Extras:",style: fontRegular.copyWith(
                  fontSize: 11.sp,
                  color: AppColor.blackColour,
                ),),
              ),
              const Spacer(),
              Row(
                children: [
                  Text("'0'",style: fontMedium.copyWith(
                    fontSize: 11.sp,
                    color: AppColor.blackColour,
                  ),),
                  SizedBox(width: 2.w,),
                  Text("'0'lb,",style: fontRegular.copyWith(
                    fontSize: 11.sp,
                    color: const Color(0xff777777),
                  ),),
                  SizedBox(width: 2.w,),
                  Text("'0w,",style: fontRegular.copyWith(
                    fontSize: 11.sp,
                    color: const Color(0xff777777),
                  ),),
                  SizedBox(width: 2.w,),
                  Text("'0nb",style: fontRegular.copyWith(
                    fontSize: 11.sp,
                    color: const Color(0xff777777),
                  ),),
                ],
              ),
            ],
          ),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          SizedBox(height: 1.h,),
          //yet to bat

          //bowling
          Row(
            children: [
              Text("Bowling",style: fontMedium.copyWith(
                fontSize: 12.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(width: 1.w,),
              SvgPicture.asset(Images.ballIcon,width: 4.w,),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text("Bowling",style: fontRegular.copyWith(
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
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          // (widget.scoreCardData.bowling!.isEmpty)?const Text('No data found'):
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, _) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 0.5.h),
                  child: const DottedLine(
                    dashColor: Color(0xffD2D2D2),
                  ),
                );
              },
              itemCount: itemList.length,
              itemBuilder: (BuildContext, int index) {

                final item = itemList[index];
                return Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                                child: Text("Arunkumar",style: fontRegular.copyWith(
                                  fontSize: 11.sp,
                                  color: AppColor.blackColour,
                                ),),
                              ),
                              SizedBox(width: 1.w,),
                              // (item.active==1)?
                              SvgPicture.asset(Images.ballBlackIcon,width: 4.w,color: AppColor.blackColour,)
                                  // :const Text(''),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("33",style: fontMedium.copyWith(
                            fontSize: 11.sp,
                            color: AppColor.blackColour,
                          ),),
                          Text("5",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                          Text("22",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                          Text("0",style: fontMedium.copyWith(
                            fontSize: 11.sp,
                            color: AppColor.blackColour,
                          ),),
                          Text("10.0",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                        ],
                      ),
                    ),
                  ],
                );
              }),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          SizedBox(height: 2.h,),
          //fall of wickets
          Row(
            children: [
              Text("Fall of wickets",style: fontMedium.copyWith(
                fontSize: 12.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(width: 1.w,),
              SvgPicture.asset(Images.stupmsIconss,width: 4.w,),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            children: [
              SizedBox(
                width: 50.w,
                child: Text("Batsman",style: fontRegular.copyWith(
                  fontSize: 11.sp,
                  color: AppColor.pri,
                ),),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Score",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("Over",style: fontRegular.copyWith(
                      fontSize: 11.sp,
                      color: const Color(0xff777777),
                    ),),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          // (widget.scoreCardData.fallOfWicket!.isEmpty)?const Text('No data found'):
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, _) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 0.5.h),
                  child: const DottedLine(
                    dashColor: Color(0xffD2D2D2),
                  ),
                );
              },
              itemCount: itemList.length,
              itemBuilder: (BuildContext, int index) {
                final item = itemList[index];
                return Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 0.5.h,bottom: 0.5.h),
                                child: Text("prasanth",style: fontRegular.copyWith(
                                  fontSize: 11.sp,
                                  color: AppColor.blackColour,
                                ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("1-20",style: fontMedium.copyWith(
                            fontSize: 11.sp,
                            color: AppColor.blackColour,
                          ),),
                          Text("2.1",style: fontRegular.copyWith(
                            fontSize: 11.sp,
                            color: const Color(0xff777777),
                          ),),
                        ],
                      ),
                    ),
                  ],
                );
              }),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          SizedBox(height: 2.h,),
          //patrnership
          Row(
            children: [
              Text("Partnerships",style: fontMedium.copyWith(
                fontSize: 12.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(width: 1.w,),
              SvgPicture.asset(Images.partnerShipIcon,width: 4.w,),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            children: [
              Text("Batsman 1",style: fontRegular.copyWith(
                fontSize: 11.sp,
                color: AppColor.pri,
              ),),
              const Spacer(),
              Text("Batsman 2",style: fontRegular.copyWith(
                fontSize: 11.sp,
                color: AppColor.pri,
              ),),
            ],
          ),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          // (widget.scoreCardData.partnerships!.isEmpty)?const Text('No data found'):
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, _) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 0.5.h),
                  child: const DottedLine(
                    dashColor: Color(0xffD2D2D2),
                  ),
                );
              },
              itemCount: itemList.length,
              itemBuilder: (context, int index) {
                final item = itemList[index];
                // int player1Runs = int.tryParse(item.player1RunsScored?.toString() ?? "0") ?? 0;
                // int player2Runs = int.tryParse(item.player2RunsScored?.toString() ?? "0") ?? 0;
                // int totalRuns = player1Runs + player2Runs;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 0.5.h,bottom: 1.h),
                      child: Row(
                        children: [
                          Text("${index+1} st",style: fontRegular.copyWith(
                              fontSize: 11.sp,
                              color: const Color(0xff666666)
                          ),),
                          SizedBox(width: 1.w,),
                          Text("Wicket",style: fontRegular.copyWith(
                              fontSize: 11.sp,
                              color: const Color(0xff666666)
                          ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 0.5.h,bottom: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Jaya",style: fontRegular.copyWith(
                                fontSize: 11.sp,
                                color: AppColor.blackColour,
                              ),),
                              SizedBox(height: 0.5.h),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: ("10"),
                                        style: fontMedium.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColor.blackColour
                                        )),
                                    TextSpan(
                                        text: "(33)",
                                        style: fontRegular.copyWith(
                                            fontSize: 11.sp,
                                            color: const Color(0xff666666)
                                        )),
                                  ])),
                            ],
                          ),
                          Column(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: ("10"),
                                        style: fontMedium.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColor.blackColour
                                        )),
                                    TextSpan(
                                        text: "(20)",
                                        style: fontRegular.copyWith(
                                            fontSize: 11.sp,
                                            color: const Color(0xff666666)
                                        )),
                                  ])),
                              SizedBox(height: 0.5.h),
                              // MyProgressIndicator(currentValue: player1Runs,totalValue: totalRuns,),
                            ],
                          ),
                          Column(
                            children: [
                              Text("siva",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColor.blackColour,
                              ),),
                              SizedBox(height: 0.5.h),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: ("22"),
                                        style: fontMedium.copyWith(
                                            fontSize: 11.sp,
                                            color: AppColor.blackColour
                                        )),
                                    TextSpan(
                                        text: "(10)",
                                        style: fontRegular.copyWith(
                                            fontSize: 11.sp,
                                            color: const Color(0xff666666)
                                        )),
                                  ])),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ],
                );
              }),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
        ],
      ),
    );
  }
}

class MyProgressIndicator extends StatelessWidget {
  int currentValue = 40;
  int totalValue = 100;

  MyProgressIndicator({super.key, required this.currentValue, required this.totalValue});


  @override
  Widget build(BuildContext context) {
    double progress = currentValue / ((totalValue==0)?1:totalValue);
    return SizedBox(
      width: 10.w,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LinearProgressIndicator(
              minHeight: 1.h,
              borderRadius: BorderRadius.circular(4),
              value: progress,
              backgroundColor: const Color(0xffAD8E2E),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFD200)),
            ),
          ],
        ),
      ),
    );
  }
}