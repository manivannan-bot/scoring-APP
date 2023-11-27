import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../models/ScoreCard/yet_to_bat.dart';
import '../../provider/scoring_provider.dart';
import '../../utils/colours.dart';
import '../../utils/images.dart';
import '../../utils/sizes.dart';





class ScoreCardTwo extends StatefulWidget {
  final String matchId;
  final String bowlTeamId;
  const ScoreCardTwo(this.matchId,this.bowlTeamId,{super.key});

  @override
  State<ScoreCardTwo> createState() => _ScoreCardTwoState();
}

class _ScoreCardTwoState extends State<ScoreCardTwo> {

  ScoreCardYetTobat? playersList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData(){
    ScoringProvider().playersYetToBat(widget.matchId, widget.bowlTeamId).then((value){
      setState(() {
        playersList=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return playersList == null
        ? const Center(child: CircularProgressIndicator(
      backgroundColor: Colors.white,
    ))
        : Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
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
              (playersList!.data!.isNotEmpty)?
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
                  itemCount: playersList!.data!.length,
                  itemBuilder: (context, int index) {
                    final item = playersList!.data![index];
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
                                child: Text("${item.playerName}",style: fontMedium.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.blackColour,
                                ),),
                              ),
                              SizedBox(height: 0.5.h,),
                              (item.battingStyle!=null)?Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: AppColor.pri,
                                    radius: 4,
                                  ),
                                  SizedBox(width: 1.w,),
                                  Text("${item.battingStyle}",style: fontRegular.copyWith(
                                    fontSize: 11.sp,
                                    color: const Color(0xff555555),
                                  ),),
                                ],
                              ):const SizedBox(),
                            ],
                          ),

                        ],
                      ),
                    );
                  }):const Text('No players found'),
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
