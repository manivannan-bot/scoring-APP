import 'package:flutter/material.dart';
import 'package:scoring_app/provider/scoring_provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/commentary/commentary_four_six_model.dart';
import '../../../utils/colours.dart';
import '../../../utils/images.dart';
import '../../../utils/sizes.dart';
import '../../../widgets/four_six_widget.dart';


class CommentaryFourSix extends StatefulWidget {
  final String matchId;
  final String teamId;
  const CommentaryFourSix(this.matchId, this.teamId, {super.key});

  @override
  State<CommentaryFourSix> createState() => _CommentaryFourSixState();
}

class _CommentaryFourSixState extends State<CommentaryFourSix> {
  CommentaryFourSixModel? commentaryFourSixModel;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData(){
    ScoringProvider().getCommentaryFoursSixes(widget.matchId, widget.teamId).then((value){
      setState(() {
        commentaryFourSixModel=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if(commentaryFourSixModel==null||commentaryFourSixModel!.data==null){
      return const SizedBox(
          height: 100,
          width: 100,
          child: Center(child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )));
    }
    if(commentaryFourSixModel!.data!.innings1!.isEmpty){
      return const Center(child: Text('No data found'));
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true, // Set to true to remove top padding
              removeBottom: true, // Set to true to remove bottom padding
              removeLeft: true, // Set to true to remove left padding
              removeRight: true,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, _) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                    );
                  },
                  itemCount: commentaryFourSixModel!.data!.innings2!.length,
                  itemBuilder: (context, int index) {
                    final item = commentaryFourSixModel!.data!.innings2![index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Over",
                                    style: fontMedium.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColor.blackColour,
                                    )),
                                TextSpan(
                                    text: " ${(item.overNumber??0)+1}",
                                    style: fontMedium.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColor.blackColour,
                                    )),
                              ])),


                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "${item.overNumber}.${item.ballNumber}",
                                style: fontMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColor.blackColour,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "${item.bowlerName}",
                                        style: fontMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: Color(0xff666666))),
                                    TextSpan(
                                        text: " to ",
                                        style: fontMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: Color(0xff666666))),
                                    TextSpan(
                                        text: "${item.batsmanName}",
                                        style: fontMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: Color(0xff666666))),
                                  ])),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              if(item.runsScored==4)...[
                                Container(
                                  height:6.h,
                                  width:10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xffDEDEDE), // Specify the border color
                                      width: 1.0, // Specify the border width
                                    ),
                                  ),
                                  child: Image.asset(Images.four),
                                ),
                              ]else if(item.runsScored==6)...[
                                Container(
                                    height:6.h,
                                    width:10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xffDEDEDE), // Specify the border color
                                      width: 1.0, // Specify the border width
                                    ),
                                  ),
                                  child: Image.asset(Images.six)
                                ),
                              ],
                              // Container(
                              //   decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     border: Border.all(
                              //       color: Color(0xffDEDEDE), // Specify the border color
                              //       width: 1.0, // Specify the border width
                              //     ),
                              //   ),
                              //   child: CircleAvatar(
                              //     backgroundColor: Color(0xffFBFAF7),
                              //     radius: 16,
                              //     child: Text("${item.runsScored}",style:fontMedium.copyWith(
                              //       fontSize: 12.sp,
                              //       color: AppColor.blackColour,
                              //     ),),
                              //   ),
                              // ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "${item.bowlerName} to ${item.batsmanName},${item.ballScored}",
                                style: fontRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.blackColour,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Color(0xffD3D3D3),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          const Divider(
            color: Color(0xffD3D3D3),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true, // Set to true to remove top padding
              removeBottom: true, // Set to true to remove bottom padding
              removeLeft: true, // Set to true to remove left padding
              removeRight: true,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, _) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                    );
                  },
                  itemCount: commentaryFourSixModel!.data!.innings1!.length,
                  itemBuilder: (context, int index) {
                    final item = commentaryFourSixModel!.data!.innings1![index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Over",
                                    style: fontMedium.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColor.blackColour,
                                    )),
                                TextSpan(
                                    text: " ${(item.overNumber??0)+1}",
                                    style: fontMedium.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColor.blackColour,
                                    )),
                              ])),


                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "${item.overNumber}.${item.ballNumber}",
                                style: fontMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColor.blackColour,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "${item.bowlerName}",
                                        style: fontMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: Color(0xff666666))),
                                    TextSpan(
                                        text: " to ",
                                        style: fontMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: Color(0xff666666))),
                                    TextSpan(
                                        text: "${item.batsmanName}",
                                        style: fontMedium.copyWith(
                                            fontSize: 12.sp,
                                            color: Color(0xff666666))),
                                  ])),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              if(item.runsScored==4)...[
                                Container(
                                  height:6.h,
                                  width:10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xffDEDEDE), // Specify the border color
                                      width: 1.0, // Specify the border width
                                    ),
                                  ),
                                  child: Image.asset(Images.four),
                                ),
                              ]else if(item.runsScored==6)...[
                                Container(
                                    height:6.h,
                                    width:10.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xffDEDEDE), // Specify the border color
                                        width: 1.0, // Specify the border width
                                      ),
                                    ),
                                    child: Image.asset(Images.six)
                                ),
                              ],
                              // Container(
                              //   decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     border: Border.all(
                              //       color: Color(0xffDEDEDE), // Specify the border color
                              //       width: 1.0, // Specify the border width
                              //     ),
                              //   ),
                              //   child: CircleAvatar(
                              //     backgroundColor: Color(0xffFBFAF7),
                              //     radius: 16,
                              //     child: Text("${item.runsScored}",style:fontMedium.copyWith(
                              //       fontSize: 12.sp,
                              //       color: AppColor.blackColour,
                              //     ),),
                              //   ),
                              // ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "${item.bowlerName} to ${item.batsmanName},${item.ballScored}",
                                style: fontRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.blackColour,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Color(0xffD3D3D3),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
