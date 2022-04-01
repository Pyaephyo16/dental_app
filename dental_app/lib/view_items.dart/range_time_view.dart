import 'package:flutter/material.dart';

class RangeTimeView extends StatelessWidget {

  final bool isPatient;
  final String time;
  final bool isBeforeTime;

  RangeTimeView({this.isPatient = true,required this.time,required this.isBeforeTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.query_builder_rounded,
        size: 22,
        color:(isPatient) ? Colors.white : (isBeforeTime) ? Colors.grey : Colors.black,
        ),
        SizedBox(width: 2,),
        Text(time,
              style: TextStyle(
                color: (isPatient) ? Colors.white : (isBeforeTime) ? Colors.grey : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              ),
      ],
    );
  }
}