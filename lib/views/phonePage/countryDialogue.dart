import 'package:awsomeNotes/model/countryModel.dart';
import 'package:awsomeNotes/providers/phoneProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dimensions.dart';

class CountryDialogue extends StatefulWidget {
  const CountryDialogue({
    Key key,
  }) : super(key: key);

  @override
  _CountryDialogueState createState() => _CountryDialogueState();
}

class _CountryDialogueState extends State<CountryDialogue> {
  String countryPhone = "(IN) +91";

  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<PhoneProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: (context),
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(Dimensions.boxHeight * 3),
              alignment: Alignment(0, 0),
              width: Dimensions.boxWidth * 80,
              height: Dimensions.boxHeight * 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.boxHeight * 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Country",
                        style: TextStyle(
                          fontSize: Dimensions.boxHeight * 3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                          icon:
                              Icon(Icons.clear, size: Dimensions.boxHeight * 4),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.boxHeight * 1.5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: countrySelect.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            obj.setCountryCode(countrySelect[i].countryCode);
                            obj.setSubName(countrySelect[i].subName);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE42959),
                              borderRadius: BorderRadius.circular(
                                  Dimensions.boxHeight * 1),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.boxWidth * 1,
                                vertical: Dimensions.boxHeight * 1),
                            padding: EdgeInsets.all(Dimensions.boxHeight * 2),
                            alignment: Alignment(-1, 0),
                            width: double.infinity,
                            child: Text(
                              countrySelect[i].countryCode +
                                  "  " +
                                  countrySelect[i].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.boxHeight * 2.5),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        //alignment: Alignment(-0.8, 0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(
            Dimensions.boxHeight * 1,
          ),
        ),
        width: double.infinity,
        height: Dimensions.boxHeight * 6,
        child: Consumer<PhoneProvider>(
          builder: (context, obj, child) => Row(
            children: [
              SizedBox(
                width: Dimensions.boxWidth * 3,
              ),
              Text(
                obj.getSubName() +
                    " " +
                    "(${obj.getCountryCode()})" +
                    " " +
                    obj.getPhoneNo(),
                style: TextStyle(
                  fontSize: Dimensions.boxHeight * 2.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
