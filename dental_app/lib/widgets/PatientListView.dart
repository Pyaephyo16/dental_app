import 'package:carousel_slider/carousel_slider.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/view_items.dart/range_time_view.dart';
import 'package:flutter/material.dart';

class PatientListView extends StatelessWidget {

  final Function onClick;
  final bool isHomePage;
  final String time;
  final String label;
  final String homePageTitle;
  final int number;
  final String detailPageTitle;
  final String detailParagraph;
  final String detailName;
  final int itemCount;
  final Function(int index) dotsPosition;

  PatientListView({
    required this.onClick,
    required this.isHomePage,
    required this.time,
    required this.label,
    required this.homePageTitle,
    required this.number,
    required this.detailPageTitle,
    required this.detailParagraph,
    required this.detailName,
    required this.itemCount,
    required this.dotsPosition,
    });

  @override
  Widget build(BuildContext context) {
    return (isHomePage) ?
    HomePageListView(
      onClick: onClick,
      time: time,
      homePageTitle: homePageTitle,
      number: number,
      itemCount: itemCount,
      ) 
    : DetailPageListView(
      time: time,
      label: label,
      detailPageTitle: detailPageTitle,
      detailParagraph: detailParagraph,
      detailName: detailName,
      itemCount: itemCount,
      dotsPosition: (index){
        dotsPosition(index);
      },
    );
  }
}

class DetailPageListView extends StatelessWidget {

  final String time;
  final String label;
  final String detailPageTitle;
  final String detailParagraph;
  final String detailName;
  final int itemCount;
  final Function(int index) dotsPosition;

  DetailPageListView({
    required this.time,
    required this.label,
    required this.detailPageTitle,
    required this.detailParagraph,
    required this.detailName,
    required this.itemCount,
    required this.dotsPosition,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: itemCount,
      //   itemBuilder: (BuildContext context,int index){
      //     return TreatmentView(
      //       time: time,
      //       label: label,
      //       detailPageTitle: detailPageTitle,
      //       detailParagraph: detailParagraph,
      //       detailName: detailName,
      //     );
      //   },
      // ),
      child: CarouselSlider.builder(
             itemCount: itemCount,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
              return TreatmentView(
                    time: time,
                    label: label,
                 detailPageTitle: detailPageTitle,
                  detailParagraph: detailParagraph,
                detailName: detailName,
              );
            },
      options: CarouselOptions(
        height: 400,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: false,
      enlargeCenterPage: false,
      onPageChanged: (index,_){
          dotsPosition(index);
      }
      ),
),
    );
  }
}

class TreatmentView extends StatelessWidget {

  final String time;
  final String label;
  final String detailPageTitle;
  final String detailParagraph;
  final String detailName;

  TreatmentView({
    required this.time,
    required this.label,
    required this.detailPageTitle,
    required this.detailParagraph,
    required this.detailName,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 340,
        margin: EdgeInsets.only(left: 12,right: 8),
        padding: EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TreatmentTitleView(time: time, label: label),
          Text(detailPageTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          ),
          SizedBox(height: 6,),
          Text(detailParagraph,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          ),
          SizedBox(height: 6,),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 12,),
              Text(detailName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          ),

            ],
          )
        ],
      ),
    );
  }
}

class TreatmentTitleView extends StatelessWidget {
  const TreatmentTitleView({
    Key? key,
    required this.time,
    required this.label,
  }) : super(key: key);

  final String time;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RangeTimeView(
          time: time, 
          isPatient: false,
        isBeforeTime: false,
        ),
        Spacer(),
        Chip(
          label: Text("$label"),
          labelStyle: TextStyle(
            color: LABEL_COLOR
          ),
          backgroundColor: LABEL_BACKGROUND_COLOR,
        ),
      ],
    );
  }
}

class HomePageListView extends StatelessWidget {
  const HomePageListView({
    Key? key,
    required this.onClick,
    required this.time,
    required this.homePageTitle,
    required this.number,
    required this.itemCount,
  }) : super(key: key);

  final Function onClick;
  final String time;
  final String homePageTitle;
  final int number;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16),
      child: ListView.separated(
        separatorBuilder: ((context, index) => SizedBox(width: 18,)),
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (BuildContext context,int index){
          return OfficeView(
            onClick: onClick,
            time: time,
            homePageTitle: homePageTitle,
            number: number,
          );
        }
        ),
    );
  }
}

class OfficeView extends StatelessWidget {

  final Function onClick;
  final String time;
  final String homePageTitle;
  final int number;

  OfficeView({
    required this.onClick,
    required this.time,
    required this.homePageTitle,
    required this.number
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
          onClick();
      },

      child: Container(
        width: 300,
        height: 140,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        color: CARD_LIST_COLOR,
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height:140,
              color: HOME_TAB_TEXTFIELD_COLOR,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                        text: homePageTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
    
                        children: [
                          TextSpan(
                            text: "  / $number partients",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )
                        ]
                      ),
                  ),
                  SizedBox(height: 12,),
                  RangeTimeView(
                    time: time,
                    isBeforeTime: false,
                  ),
                  SizedBox(height: 14,),
                  Row(
                    children: [
                      CircleAvatar(
                        minRadius: 14,
                        maxRadius: 14,
                        backgroundImage: NetworkImage("https://mobirise.com/bootstrap-template/profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg",),
                      ),
                      SizedBox(width: 14,),
                       CircleAvatar(
                         minRadius: 14,
                        maxRadius: 14,
                        backgroundImage: NetworkImage("https://mobirise.com/bootstrap-template/profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg",),
                      ),
                      SizedBox(width: 14,),
                       CircleAvatar(
                         minRadius: 14,
                        maxRadius: 14,
                        backgroundImage: NetworkImage("https://mobirise.com/bootstrap-template/profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg",),
                      ),
                      SizedBox(width: 106,),
                      Icon(Icons.check_circle,color: HOME_TAB_TEXTFIELD_COLOR,size: 32,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

