import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../utils/sizes.dart';


class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen>with SingleTickerProviderStateMixin {
  late TabController tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 0.1.h,horizontal: 5.w),
              labelColor: Colors.white,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primaryColor
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 04.w,vertical: 0.4.h),
                  child: Row(
                    children: [
                      Text('DCC',
                        style: fontMedium.copyWith(fontSize: 13.sp,color: AppColor.blackColour),),
                      Text('1st Innings',
                        style: fontMedium.copyWith(fontSize: 11.sp,color: Color(0xff666666)),),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      Text('SP',
                        style: fontMedium.copyWith(fontSize: 13.sp,color: AppColor.blackColour),),
                      Text('2nd Innings',
                        style: fontMedium.copyWith(fontSize: 11.sp,color: Color(0xff666666)),),
                    ],
                  ),
                ),
              ]
          ),
          SizedBox(height: 1.h,),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children:  [
                  Container(),
                  Container(),
                ]
                ),
          ),
        ],
      ),
    );
  }
}
