import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../utils/colours.dart';
import '../utils/images.dart';
import '../utils/sizes.dart';


class PlayerSearchScreen extends StatefulWidget {
  const PlayerSearchScreen({super.key});

  @override
  State<PlayerSearchScreen> createState() => _PlayerSearchScreenState();
}

class _PlayerSearchScreenState extends State<PlayerSearchScreen> {
  final List<Map<String,dynamic>>itemList=[
    {},{},{},{},{},{},{},{},{},{},{},{},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.w
              ) + EdgeInsets.only(
                  top: 2.h
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: AppColor.textColor, size: 7.w,)),
                  Text("Players",
                    style: fontMedium.copyWith(
                        fontSize: 15.sp,
                        color: AppColor.textColor
                    ),),
                  SizedBox(width: 7.w,),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                height: 5.h,
                padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 1.h,
                        ),
                decoration: BoxDecoration(
                          color: AppColor.lightColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                child: Row(
                  children:[
                              Expanded(
                                child: TextFormField(
                                  cursorColor: AppColor.secondaryColor,
                                  onChanged: (value) {
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText: "Search Player’s ID",
                                    hintStyle: fontRegular.copyWith(
                                        fontSize: 10.sp,
                                        color: AppColor.textMildColor
                                    ),),
                                ),
                              ),

                           SvgPicture.asset(Images.searchIcon, color: AppColor.iconColour, width: 3.5.w,),
                            ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Expanded(
              child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, _) {
              return Padding(
                padding: EdgeInsets.only(bottom: 2.h),
              );
          },
          itemCount:itemList.length ,
          itemBuilder: (context, int index) {
              final item = itemList[index];
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w,),
                child: Column(
                  children: [
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.lightColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(child: Image.asset(Images.profileImage,width: 14.w,)),
                          SizedBox(width: 2.w,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30.w,
                                  child: Text("Prasanth",style: fontMedium.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.blackColour,
                                  ),),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColor.pri,
                                      radius: 4,
                                    ),
                                    SizedBox(width: 1.w,),
                                    Text("RHB",style: fontRegular.copyWith(
                                        fontSize: 11.sp,
                                        color: Color(0xff666666)
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Text("ID:8767567",style: fontRegular.copyWith(
                              fontSize: 11.sp,
                              color: Color(0xff666666)
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }),
            )
          ],
        ),
      ),
    );
  }
}
