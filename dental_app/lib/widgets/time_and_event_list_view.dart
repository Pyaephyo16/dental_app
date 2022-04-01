
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/view_items.dart/range_time_view.dart';
import 'package:flutter/material.dart';

class TimeAndEventListView extends StatelessWidget {

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Function refresh;

  const TimeAndEventListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286,
      height: 400,
      child: RefreshIndicator(
        onRefresh: () async{
            refresh();
        },

        child: itemCount ==0 ?
        Center(
          child: Text("Sorry,This is not available now",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: PRIMARY_COLOR,
          ),
          ),
        )
        : ListView.builder(
          //shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}


