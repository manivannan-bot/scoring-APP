import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';


class MyMatchesUpcomingScreen extends StatefulWidget {
  const MyMatchesUpcomingScreen({super.key});

  @override
  State<MyMatchesUpcomingScreen> createState() => _MyMatchesUpcomingScreenState();
}

class _MyMatchesUpcomingScreenState extends State<MyMatchesUpcomingScreen> {
  final List<Map<String,dynamic>>itemList=[
    {},{},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, _) {
          return Padding(
            padding: EdgeInsets.only(bottom: 2.h),
          );
        },
        itemCount:itemList.length ,
        itemBuilder: (BuildContext, int index) {
          final item = itemList[index];
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
                                padding:  EdgeInsets.only(left: 2.w,top: 0.h),
                                child: Row(
                                  children: [
                                    Image.asset(Images.teamaLogo,width: 10.w,),
                                    SizedBox(width: 3.w,),
                                    Text("Toss and tails",style: fontMedium.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColor.blackColour,
                                    ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 2.w,top: 1.h),
                                child: Row(
                                  children: [
                                    Image.asset(Images.teamblogo,width: 10.w,fit: BoxFit.fill,),
                                    SizedBox(width: 3.w,),
                                    Text("Dhoni CC", style: fontMedium.copyWith(
                                        fontSize: 13.sp,
                                        color:AppColor.blackColour
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          //dassh
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
                          Padding(
                            padding:  EdgeInsets.only(right: 4.w,top: 1.h),
                            child: Column(
                              children: [
                                Text("29/06/2023",style: fontRegular.copyWith(
                                    fontSize: 12.sp,
                                    color: Color(0xff666666)
                                ),),
                                Text("11:00 AM", style: fontMedium.copyWith(
                                  fontSize: 13.sp,
                                  color:AppColor.pri,
                                ),),
                              ],
                            ),
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
