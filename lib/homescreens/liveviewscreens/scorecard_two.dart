import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';


class ScoreCardTwo extends StatefulWidget {
  const ScoreCardTwo({super.key});
  @override
  State<ScoreCardTwo> createState() => _ScoreCardTwoState();
}

class _ScoreCardTwoState extends State<ScoreCardTwo> {
  List<Map<String,dynamic>> itemList=[
    {},{},{},{},{},{},{},
  ];

  @override

  @override
  Widget build(BuildContext context) {
    // if(playersList==null){
    //   return const SizedBox(
    //       height: 100,
    //       width: 100,
    //       child: Center(child: CircularProgressIndicator(
    //         backgroundColor: Colors.white,
    //       )));
    // }
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 4.w),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(child: Image.asset(Images.logoAll,width: 50.w,)),
                  SizedBox(height: 0.5.h,),
                  Text('Innings has not started yet.',style: fontMedium.copyWith(
                    fontSize: 12.sp,
                    color: AppColor.pri,
                  ),),
                ],
              ),
              SizedBox(height: 1.h,),
              Text('Playing XI',style: fontMedium.copyWith(
                fontSize: 14.sp,
                color: AppColor.blackColour,
              ),),
              SizedBox(height: 1.h,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, _) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: const DottedLine(
                        dashColor: Color(0xffD2D2D2),
                      ),
                    );
                  },
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext, int index) {
                    final item = itemList[index];
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        children: [
                          ClipOval(child: Image.asset(Images.profileImage,width: 14.w,)),
                          SizedBox(width: 4.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.w,
                                child: Text("Hari",style: fontMedium.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.blackColour,
                                ),),
                              ),
                              SizedBox(height: 0.5.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColor.pri,
                                    radius: 4,
                                  ),
                                  SizedBox(width: 1.w,),
                                  Text("Left hand batsman",style: fontRegular.copyWith(
                                      fontSize: 11.sp,
                                      color: Color(0xff555555),
                                  ),)
                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                    );
                  }),
                const Divider(
                color: Color(0xffD3D3D3),
              ),
            ],
          ),
        ],
        ),
    );
  }
}
