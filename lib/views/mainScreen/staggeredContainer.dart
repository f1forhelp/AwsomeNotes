import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/model/mainPageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StaggeredContainer extends StatelessWidget {
  final int index;
  StaggeredContainer(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainPageModel.instance().mainData[index].color,
        borderRadius: BorderRadius.circular(
          Dimensions.boxHeight * 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            MainPageModel.instance().mainData[index].title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Dimensions.boxHeight * 3),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: Dimensions.boxHeight * 2,
          ),
          Text(
            MainPageModel.instance().mainData[index].message,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
          Text(
            MainPageModel.instance().mainData[index].dateTime.day.toString() +
                "-" +
                MainPageModel.instance()
                    .mainData[index]
                    .dateTime
                    .month
                    .toString() +
                "-" +
                MainPageModel.instance()
                    .mainData[index]
                    .dateTime
                    .year
                    .toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

aaa() {
  DateTime.now().year;
}
