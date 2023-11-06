import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoring_app/homescreens/upcoming_screens.dart';
import 'package:sizer/sizer.dart';

import '../morescreens/more_screen.dart';
import '../utils/colours.dart';
import '../utils/images.dart';
import '../utils/sizes.dart';
import 'completed_screen.dart';
import 'for_you_matches.dart';
import 'live_screen.dart';
import 'liveviewscreens/live_screen_home.dart';
import 'my_matches_home.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin  {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 23.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.bannerbg), // Replace with your image path
                  fit: BoxFit.cover, // You can change the BoxFit as needed
                ),
              ),
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            Images.splashBottom,
                            width: 24.w,
                          ),
                        ),
                        SizedBox(width: 4.w,),

                        GestureDetector(
                          onTap: (){
                          Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) => MoreScreen()));
                          },
                          child: Text('Hello!\n prasanth',style: fontMedium.copyWith(
                              fontSize: 15.sp,
                              color: AppColor.lightColor
                          ),),
                        ),
                        Spacer(),
                        SvgPicture.asset(Images.notificationIcon,color: AppColor.lightColor,)
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Row(
                      children: [
                        SvgPicture.asset(Images.locationIcon),
                        SizedBox(width: 2.w,),
                        GestureDetector(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => SampleScreen()));
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: ("Chrompet,"),
                                    style: fontRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColor.lightColor,
                                    )),
                                TextSpan(
                                    text: "Chennai 600210",
                                    style: fontRegular.copyWith(
                                        fontSize: 12.sp,
                                        color: AppColor.lightColor
                                    )),
                              ])),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 1.h,),
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
                Text('For you',style: fontRegular.copyWith(fontSize: 12.sp,),),
                Text('My matches',style: fontRegular.copyWith(fontSize: 12.sp,),),
              ],
            ),
            const Divider(),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LiveScreenHome()));
                      },
                        child: LiveScreen()),
                    UpcomingScreen(),
                    CompletedScreen(),
                    ForYouMatches(),
                    MymatchesHomeScreen(),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
