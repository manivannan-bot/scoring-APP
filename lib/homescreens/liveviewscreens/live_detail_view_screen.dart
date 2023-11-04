import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';

class LiveDetailViewScreen extends StatefulWidget {
  const LiveDetailViewScreen({super.key});

  @override
  State<LiveDetailViewScreen> createState() => _LiveDetailViewScreenState();
}

class _LiveDetailViewScreenState extends State<LiveDetailViewScreen> {
  final List<Map<String, dynamic>> itemList = [
    {},
    {},
  ];
  @override
  Widget build(BuildContext context) {
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
          child: Text(
            "CRR: 4.50",
            style: fontMedium.copyWith(
              fontSize: 10.sp,
              color: AppColor.lightColor,
            ),
          ),
        ),
        SizedBox(height: 2.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              Text(
                "Batting",
                style: fontMedium.copyWith(
                  fontSize: 14.sp,
                  color: AppColor.blackColour,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              SvgPicture.asset(
                Images.batIcon,
                width: 5.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text(
                  "Batsman",
                  style: fontRegular.copyWith(
                    fontSize: 12.sp,
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
                        fontSize: 12.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "B",
                      style: fontRegular.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "4s",
                      style: fontRegular.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xff777777),
                      ),
                    ),
                    Text(
                      "6s",
                      style: fontRegular.copyWith(
                        fontSize: 12.sp,
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
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
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
                                  Text(
                                    "Vijay kumar",
                                    // "${item.playerName}",
                             style: fontRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.blackColour,
                                  ),),
                                  SizedBox(width: 1.w,),
                                  // (item.isOut!=1)?
                                  SvgPicture.asset(Images.batIcon,width: 4.w,color: AppColor.blackColour,)
                                      // :Text(''),
                                ],
                              ),
                              SizedBox(height: 0.5.h,),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "Batting",
                                        style: fontRegular.copyWith(
                                          fontSize: 11.sp,
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
                              Text("55",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("33",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("5",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("3",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("300",style: fontRegular.copyWith(
                                fontSize: 12.sp,
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
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              Text("Bowling",style: fontMedium.copyWith(
                fontSize: 14.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(width: 1.w,),
              SvgPicture.asset(Images.ballIcon,width: 5.w,),
            ],
          ),
        ),
        SizedBox(height: 1.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              SizedBox(
                width: 35.w,
                child: Text("Bowler",style: fontRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColor.pri,
                ),),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("O",style: fontRegular.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("M",style: fontRegular.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("R",style: fontRegular.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("W",style: fontRegular.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff777777),
                    ),),
                    Text("Eco",style: fontRegular.copyWith(
                      fontSize: 12.sp,
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
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
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
                                  Text(
                                    "Vijay kum",
                                    // "${item.playerName}",
                                    style: fontRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColor.blackColour,
                                    ),),
                                  SizedBox(width: 1.w,),
                                  // (item.isOut!=1)?
                                  SvgPicture.asset(Images.ballBlackIcon,width: 4.w,color: AppColor.blackColour,)
                                  // :Text(''),
                                ],
                              ),
                              SizedBox(height: 0.5.h,),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                        "Batting",
                                        style: fontRegular.copyWith(
                                          fontSize: 11.sp,
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
                              Text("5",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("3",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("10",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("30",style: fontRegular.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff777777),
                              ),),
                              Text("9",style: fontRegular.copyWith(
                                fontSize: 12.sp,
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
      ],
    );
  }
}
