import 'package:badges/badges.dart';
import 'package:dental_app/pages/detail_page.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/resources/constants.dart';
import 'package:dental_app/view_items.dart/range_time_view.dart';
import 'package:dental_app/widgets/PatientListView.dart';
import 'package:dental_app/widgets/Modified_time_and_event_list_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CalendarTab extends StatefulWidget {

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {



List<String> dropDownList = ["Monday","Tueday","Wedesday","Thursday","Friday","Saturday","Sunday"];

List<String> timeList = ["8:00","8:30","9:00","9:30","10:00","10:30","11:00","11:30","12:00","12:30","1:00","1:30","2:00","2:30","3:00"];

List<Widget> timeAndEventCardInfoList = [

  TimeAndEventItemView(
    title: "Franciso Eiliot",
     iconData: Icon(Icons.home),
      time: "8:00 AM - 8:30 AM",
      isBeforeTime: true,
      onClick: (context) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DetailPage()),
      ),
      ),

       TimeAndEventItemView(
    title: "Issac Alexander",
     iconData: Icon(Icons.medication_outlined),
      time: "9:00 AM - 9:30 AM",
      onClick: (context) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DetailPage()),
      ),
      ),

       TimeAndEventItemView(
    title: "Vera Heapkins",
     iconData: Icon(Icons.enhanced_encryption),
      time: "10:00 AM - 10:30 AM",
      onClick: (context) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DetailPage()),
      ),
      ),



         TimeAndEventItemView(
    title: "John Nack",
     iconData: Icon(Icons.enhanced_encryption),
      time: "11:00 AM - 11:30 AM",
      onClick: (context) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DetailPage()),
      ),
       ),

         TimeAndEventItemView(
    title: "Cydra Clone",
     iconData: Icon(Icons.enhanced_encryption),
      time: "12:00 AM - 12:30 AM",
      onClick: (context) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DetailPage()),
      ),
      ),

         TimeAndEventItemView(
    title: "Formula Smith",
     iconData: Icon(Icons.enhanced_encryption),
      time: "1:00 PM - 1:30 PM",
      onClick: (context) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DetailPage()),
      ),
      ),

];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TIME_AND_EVENT_UNDER_BACKGROUND_COLOR,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                PatientInfoView(dropDownList: dropDownList),
                SizedBox(height: MARGIN_LARGE_OVER_2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_BETWEEN_SIZE),
                  child: Row(
                    children: [
                      Text("Time"),
                      SizedBox(width: MARGIN_LARGE_OVER,),
                      Text("Event"),
                    ],
                  ),
                ),
                SizedBox(height: MARGIN_TINY_SMALL,),
                Container(
                  //height: MediaQuery.of(context).size.height / 2,
                  height: TIME_AND_EVENT_SECTION_CONTAINER_HEIGHT,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: MARGIN_MEDIUM_BETWEEN_SIZE),
                    child: ShowTimeSection(timeList: timeList, timeAndEventCardInfoList: timeAndEventCardInfoList),
            
                  ),
                )
              ],
            ),
          ),


          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: PatientListView(
              onClick: () =>
              _navigateToNextScreen(context,DetailPage()),
              isHomePage: true,
              time: "8:30 AM - 02:00 PM",
              label: "",
              homePageTitle: "Office No.348",
              number: 3,
              detailPageTitle: "",
              detailParagraph: "",
              detailName: "",
              itemCount: 10,
              dotsPosition: (index){},
            ),
            ),
        ],
      ),
    );
  }

  Future<dynamic> _navigateToNextScreen(BuildContext context,Widget pageWidget) {
    return Navigator.push(
              context,
             MaterialPageRoute(builder: (BuildContext context) => pageWidget),
             );
  }
}

class ShowTimeSection extends StatelessWidget {

  ShowTimeSection({
    Key? key,
    required this.timeList,
    required this.timeAndEventCardInfoList,
  }) : super(key: key);

  final List<String> timeList;
  final List<Widget> timeAndEventCardInfoList;

  @override
  Widget build(BuildContext context) {
    return ModifiedTimeAndEventListView(
        itemCount: 1,
        itemBuilder: (BuildContext context,int index){
        return ModifiedListView(
          timeList: timeList, 
          timeAndEventCardInfoList: timeAndEventCardInfoList,
          );
      },
      refresh: () =>
       SnackBarNotiView(context),
        endList: () =>
        SnackBarNotiView(context),
      );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> SnackBarNotiView(BuildContext context) {
    return Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
               content: Text("time and event doing refresh"),
               backgroundColor: PRIMARY_COLOR,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(MARGIN_SMALL_3),
                   topRight: Radius.circular(MARGIN_SMALL_3),
                 )
               ),
              ),
          );
  }
}



class TimeAndEventItemView extends StatelessWidget {

  final String title;
  final Icon iconData;
  final String time;
  final bool isBeforeTime;
  final Function(BuildContext context) onClick;

  TimeAndEventItemView({
    required this.title,
    required this.iconData,
    required this.time,
    this.isBeforeTime = false,
    required this.onClick,
    });


  @override
  Widget build(BuildContext context) {
    return Container(
        width: EVENT_CARD_CONTAINER_WIDTH,
        height: EVENT_CARD_CONTAINER_HEIGHT,
        margin: EdgeInsets.all( MARGIN_SMALL_3),
        decoration: BoxDecoration(
          color: (isBeforeTime) ? Colors.grey.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(MARGIN_SMALL_3),
        ),
        child: ListTile(
          enabled: (isBeforeTime) ? false : true,
          onTap: (){
            onClick(context);
          },
          minLeadingWidth: MARGIN_SMALL_3,
          leading: Container(
            width: MARGIN_MEDIUM_5,
            height: MARGIN_MEDIUM_5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
              color:HOME_TAB_TEXTFIELD_COLOR,
            ),
            child: iconData,
          ),
          title: Text(title,
          style: TextStyle(
            color: (isBeforeTime) ? BEFORE_TIME_TEXT_COLOR : Colors.black,
          ),
          ),
          subtitle: RangeTimeView(
            isPatient: false,
            time: time,
            isBeforeTime: isBeforeTime,
            ),
        ),
    );
  }
}

class ModifiedListView extends StatelessWidget {
  const ModifiedListView({
    Key? key,
    required this.timeList,
    required this.timeAndEventCardInfoList,
  }) : super(key: key);

  final List<String> timeList;
  final List<Widget> timeAndEventCardInfoList;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      TimeSectionView(timeList: timeList),
      DottedLineView(),
      TimeAndEventListView(
      itemBuilder: (BuildContext context,int index){
            return timeAndEventCardInfoList[index];
           },
          itemCount: timeAndEventCardInfoList.length,
     ),
    ],
    );
  }
}



class TimeSectionView extends StatelessWidget {
  const TimeSectionView({
    Key? key,
    required this.timeList,
  }) : super(key: key);

  final List<String> timeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Container(
           margin: EdgeInsets.only(top: MARGIN_MEDIUM),
            width: TIME_LIST_WIDTH,
            child: ListView.separated(
              separatorBuilder: (context,index) => SizedBox(height: MARGIN_MEDIUM_4,),
              shrinkWrap: true,
            scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: timeList.length,
              itemBuilder: (BuildContext context,int index){
                return Text("${timeList[index]}",
                style: TextStyle(
                  color: TIME_NUMBER_COLOR,
                  fontWeight: FontWeight.w500,
                ),);
              }
              ),
          ),
      ],
    );
  }
}

class TimeAndEventListView extends StatelessWidget {

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const TimeAndEventListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286,
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
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}


class DottedLineView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       DottedLine(
       direction: Axis.vertical,
       lineLength: 100,
       dashColor: TIME_NUMBER_COLOR,
       lineThickness: 2.6,
       dashGapLength: 6.0,
        ),
        Icon(Icons.circle,size: 12,color: PRIMARY_COLOR,)
      ],
    );
  }
}

class PatientInfoView extends StatelessWidget {
  const PatientInfoView({
    Key? key,
    required this.dropDownList,
  }) : super(key: key);

  final List<String> dropDownList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            HOME_TAB_BACKGROUND_FIRST_COLOR,
            PRIMARY_COLOR,
            HOME_TAB_BACKGROUND_SECOND_COLOR,
          ]
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
          child: Column(
            children: [
              SizedBox(height: MARGIN_MEDIUM,),
              SearchBarAndProfile(
                notiNumber: 3,
              ),
              SizedBox(height: MARGIN_MEDIUM,),
              PatientsView(dropDownList: dropDownList),
            ],
          ),
        ),
    );
  }
}

class SearchBarAndProfile extends StatelessWidget {

  final int notiNumber;

  SearchBarAndProfile({required this.notiNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFieldView(),
        SizedBox(width: MARGIN_MEDIUM_5,),
        ProfileView(
          notiNumber: notiNumber,
        ),
      ],
    );
  }
}

class PatientsView extends StatelessWidget {
  const PatientsView({
    required this.dropDownList,
  });

  final List<String> dropDownList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("My Patients",
      style: TextStyle(
        fontSize: TEXT_REGULAR_4,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      ),
      subtitle: Text("12 total",
      style: TextStyle(
        fontSize: TEXT_REGULAR,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_TINY_SMALL),
        decoration: BoxDecoration(
          color: HOME_TAB_TEXTFIELD_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_SMALL_3),
        ),
        child: DropdownButton(
          icon: Icon(Icons.arrow_drop_down_outlined,size: 36,color: Colors.white,),
          underline: SizedBox(),
          hint: Text("Today",
          style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
          ),
          items: dropDownList.mapIndexed((i,date){
              return DropdownMenuItem(child: Text("$date"),value: i,);
          }).toList(),
           onChanged: (index){
             ///ToDo
           }
           ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {

  final int notiNumber;

  ProfileView({required this.notiNumber});

  @override
  Widget build(BuildContext context) {
    return Badge(
        badgeContent: Text("$notiNumber",
        style: TextStyle(
          color: Colors.white,
        ),),
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: PROFILE_IMG_WIDTH,
          height: PROFILE_IMG_HEIGHT,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
          ),
          child: Image.network("http://lavinephotography.com.au/wp-content/uploads/2017/01/PROFILE-Photography-112.jpg",
            fit: BoxFit.fill,
            ),
        ),
    );
  }
}

class TextFieldView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1),
      width: TEXT_FORM_FIELD_WIDTH,
      height: TEXT_FORM_FIELD_HEIGHT,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MARGIN_MEDIUM_3X),
          topRight: Radius.circular(MARGIN_MEDIUM_3X),
          bottomLeft: Radius.circular(MARGIN_LARGE_2X),
          bottomRight: Radius.circular(MARGIN_LARGE_2X),
        ),
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          suffixIcon: Icon(Icons.search,color: Colors.white,),
          border: InputBorder.none,
          filled: true,
          fillColor: HOME_TAB_TEXTFIELD_COLOR.withOpacity(0.4),
        ),
      ),
    );
  }
}


