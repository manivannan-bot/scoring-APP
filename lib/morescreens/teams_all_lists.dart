import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/colours.dart';
import '../utils/images.dart';
import '../utils/sizes.dart';


class TeamAllLists extends StatefulWidget {
  const TeamAllLists({super.key});

  @override
  State<TeamAllLists> createState() => _TeamAllListsState();
}

class _TeamAllListsState extends State<TeamAllLists> {
  final List<Map<String,dynamic>>itemList=[
    {},{},{},
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Teams",
                    style: fontMedium.copyWith(
                        fontSize: 15.sp,
                        color: AppColor.textColor
                    ),),
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
                          hintText: "Search Team’s",
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
              child:    GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 1 column
                  childAspectRatio: 1.1, // Adjust the aspect ratio as needed
                ),
                itemCount: itemList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  // if(widget.scoreCardData.yetToBatPlayers!.isEmpty){
                  //   return Text('No data found');
                  // }
                  final item = itemList[index];
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(Images.teamImageGrid,width: 45.w,),
                          Positioned(
                            top: 1.5.h,
                            right:3.w,
                            child: Container(
                              height:4.h,
                              width:8.5.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColor.lightColor,
                              ),
                              child: Icon(Icons.favorite_border_outlined,color: Color(0xff989696),),
                            ),
                          ),
                        ],
                      )

                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
