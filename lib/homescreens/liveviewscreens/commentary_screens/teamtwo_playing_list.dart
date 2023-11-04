import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/colours.dart';
import '../../../utils/images.dart';
import '../../../utils/sizes.dart';


class TeamTwoPlayingList extends StatefulWidget {
  const TeamTwoPlayingList({super.key});

  @override
  State<TeamTwoPlayingList> createState() => _TeamTwoPlayingListState();
}

class _TeamTwoPlayingListState extends State<TeamTwoPlayingList> {
  final List<Map<String, dynamic>> itemList = [
    {},

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 6.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
              color: AppColor.lightColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Captain',style: fontMedium.copyWith(fontSize: 14.sp,color: AppColor.pri),),
              SizedBox(height: 0.5.h,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, _) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: Divider(
                        color: Color(0xffD3D3D3),
                      ),
                    );
                  },
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext, int index) {
                    final item = itemList[index];
                    return   Padding(
                      padding:  EdgeInsets.only(top: 0.5.h,bottom: 0.8.h),
                      child: Row(
                        children: [
                          ClipOval(child: Image.asset(Images.profileImage,width: 14.w,)),
                          SizedBox(width: 5.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Arun',style: fontMedium.copyWith(
                                fontSize: 12.sp,
                                color: AppColor.blackColour,
                              ),),
                              SizedBox(height: 0.5.h,),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: AppColor.pri,
                                    radius: 4,
                                  ),
                                  SizedBox(width: 1.w,),
                                  Text("Right hand batsman",style: fontRegular.copyWith(
                                    fontSize: 11.sp,
                                    color: Color(0xff555555),
                                  ),),
                                ],
                              ),
                            ],),

                          Spacer(),
                          SvgPicture.asset(Images.arrowICon,width: 6.5.w,),

                        ],
                      ),
                    );
                  }),
              Divider(
                color: Color(0xffD3D3D3),
              ),
              Text(' Players',style: fontMedium.copyWith(fontSize: 14.sp,color: AppColor.pri),),
              SizedBox(height: 0.5.h,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, _) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: const Divider(
                        color: Color(0xffD3D3D3),
                      ),
                    );
                  },
                  itemCount: itemList.length,
                  itemBuilder: (context, int index) {
                    final item = itemList[index];
                    return   Padding(
                      padding:  EdgeInsets.only(top: 0.5.h,bottom: 0.8.h),
                      child: Row(
                        children: [
                          ClipOval(child: Image.asset(Images.profileImage,width: 14.w,)),
                          SizedBox(width: 5.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Manikandan',style: fontMedium.copyWith(
                                fontSize: 12.sp,
                                color: AppColor.blackColour,
                              ),),
                              SizedBox(height: 0.5.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColor.pri,
                                    radius: 4,
                                  ),
                                  SizedBox(width: 1.w,),
                                  Text("Right hand batsman",style: fontRegular.copyWith(
                                    fontSize: 11.sp,
                                    color: Color(0xff555555),
                                  ),),
                                ],
                              )
                            ],),
                          Spacer(),
                          GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerDetailViewScreen(item.playerId.toString())));
                              },
                              child: SvgPicture.asset(Images.arrowICon,width: 6.5.w,)),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),

    );
  }
}
