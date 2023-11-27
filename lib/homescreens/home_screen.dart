import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoring_app/auth/enter_otp.dart';
import 'package:scoring_app/auth/login_screen.dart';
import 'package:scoring_app/auth/splash_screen.dart';
import 'package:scoring_app/homescreens/summary/completed_screen_view.dart';

import 'package:sizer/sizer.dart';

import '../auth/register_screen.dart';
import '../auth/verify_mobile_number.dart';
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
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainBgColor,
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
                            width: 20.w,
                          ),
                        ),
                        SizedBox(width: 4.w,),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MoreScreen()));
                          },
                          child: Text('Hello!\nPrasanth',style: fontMedium.copyWith(
                              fontSize: 14.sp,
                              color: AppColor.lightColor
                          ),),
                        ),
                        Spacer(),
                        SvgPicture.asset(Images.notificationIcon,color: AppColor.lightColor,width: 5.w,)
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Row(
                      children: [
                        SvgPicture.asset(Images.locationIcon),
                        SizedBox(width: 2.w,),
                        GestureDetector(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
                             //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyMobileNumber()));
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedScreenView()));
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: ("Chrompet,"),
                                    style: fontRegular.copyWith(
                                      fontSize: 10.5.sp,
                                      color: AppColor.lightColor,
                                    )),
                                TextSpan(
                                    text: " Chennai 600210",
                                    style: fontRegular.copyWith(
                                        fontSize: 10.5.sp,
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
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: AppColor.unselectedTabColor,
              labelColor:  const Color(0xffD78108),
              indicatorColor: const Color(0xffD78108),
              isScrollable: true,
              controller: tabController,
              indicatorWeight: 2.0,
              labelStyle: fontMedium.copyWith(
                  fontSize: 12.sp
              ),
              unselectedLabelStyle: fontRegular.copyWith(
                  fontSize: 12.sp
              ),
              // labelPadding: EdgeInsets.only(bottom: 0.5.h),// Set the indicator weight
              tabs: [
                Tab(
                  text: "Live",
                ),
                Tab(
                  text: "Finished",
                ),
                Tab(
                  text: "For you",
                ),
              ],
            ),
            Theme(
                data: ThemeData(
                  dividerTheme: const DividerThemeData(
                    space: 0, // Set space to 0 to remove top and bottom padding
                    thickness: 0.5, // Set thickness to desired value
                    indent: 0, // Set indent to desired value
                    endIndent: 0, // Set endIndent to desired value
                  ),
                ),
                child: const Divider()),
            SizedBox(height: 2.h,),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [
                    LiveScreen(),
                    CompletedScreen(),
                    ForYouMatches(),
                    // MymatchesHomeScreen(),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
