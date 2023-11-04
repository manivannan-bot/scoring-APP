import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colours.dart';
import '../../widgets/for_you_matches_live _widgets.dart';
import '../../widgets/individual_player_upcoming_matches.dart';

class PlayerMatchesList extends StatefulWidget {
  const PlayerMatchesList({super.key});

  @override
  State<PlayerMatchesList> createState() => _PlayerMatchesListState();
}

class _PlayerMatchesListState extends State<PlayerMatchesList> {
  final List<Map<String, dynamic >> itemList = [
    {
      'type': 'live',


    },
    {
      'type': 'upcoming',

    },
    {
      'type': 'completed',

    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            color: AppColor.lightColor
        ),
        child: Expanded(
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
                // return ForYouLiveMatches();
                if (item['type']=='live'){
                  return ForYouLiveMatches();
                } else if (item['type']=='upcoming') {
                  return IndividualPlayerUpcomingMatches();
                }
              }),
        )
    );
  }
}
