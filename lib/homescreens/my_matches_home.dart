import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/colours.dart';
import '../utils/sizes.dart';
import 'mymatchesscreens/my_matches_finished_screen.dart';
import 'mymatchesscreens/my_matches_live_screen.dart';
import 'mymatchesscreens/my_matches_upcoming_screen.dart';


class MymatchesHomeScreen extends StatefulWidget {
  const MymatchesHomeScreen({super.key});

  @override
  State<MymatchesHomeScreen> createState() => _MymatchesHomeScreenState();
}

class _MymatchesHomeScreenState extends State<MymatchesHomeScreen>with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TabBar(
          unselectedLabelColor: AppColor.unselectedTabColor,
          labelColor:  const Color(0xffD78108),
          indicatorColor: const Color(0xffD78108),
          isScrollable: true,
          controller: tabController,
          indicatorWeight: 4.0, // Set the indicator weight
          tabs: [
            Text('Live',style: fontRegular.copyWith(fontSize: 12.sp,),),
            Text('Upcoming',style: fontRegular.copyWith(fontSize: 12.sp,),),
            Text('Finished',style: fontRegular.copyWith(fontSize: 12.sp,),),
          ],
        ),
        const Divider(),
        Expanded(
          child: TabBarView(
              controller: tabController,
              children: [
                MyMatchesLiveScreen(),
                MyMatchesUpcomingScreen(),
                MyMatchesFinishedScreen(),
              ]
          ),
        ),
      ],
    );
  }
}
