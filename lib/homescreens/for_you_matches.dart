import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/for_you_matches_live _widgets.dart';
import '../widgets/individual_player_upcoming_matches.dart';


class ForYouMatches extends StatefulWidget {
  const ForYouMatches({super.key});

  @override
  State<ForYouMatches> createState() => _ForYouMatchesState();
}

class _ForYouMatchesState extends State<ForYouMatches> {
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
    return  ListView.separated(
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

        });
  }
}
