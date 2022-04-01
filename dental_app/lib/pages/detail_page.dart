import 'dart:io';
import 'dart:ui' as ui;

import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/constants.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/widgets/PatientListView.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  double position = 0.0;
  ui.Image? image1;

  // @override
  // void initState() {
  //   loadImage("./assets/tooth_1.jpg");
  //   super.initState();
  // }
  // Future loadImage(String path) async{
  //   final data = await rootBundle.load(path);
  //   final bytes = data.buffer.asUint8List();
  //   final image = await decodeImageFromList(bytes);
  //   setState(() {
  //     image1 = image;
  //   });
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Positioned.fill(
           child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/2,
                padding: EdgeInsets.only(top: MARGIN_LARGE_3,left: MARGIN_MEDIUM),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      HOME_TAB_BACKGROUND_FIRST_COLOR,
                PRIMARY_COLOR,
                HOME_TAB_BACKGROUND_SECOND_COLOR,
                    ]
                  )
                ),
                child: Column(
                  children: [
                    DetailInfoView(),
                    ClientDataView(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/3,
                color: PRIMARY_COLOR,
              ),
              Container(
                  width: double.infinity,
                height: MediaQuery.of(context).size.height/6,
                color: DETAIL_PAGE_BACKGROUND_BOTTOM_COLOR,
              ),
            ],
                 ),
         ),

         Positioned(
           top: 232,
           left: 10,
           right: 10,
           child: Center(
             child: Container(
               width: CUSTOM_PAINT_CONTAINER_WIDTH,
               height: CUSTOM_PAINT_CONTAINER_HEIGHT,
               decoration: BoxDecoration(
               ),
               child: CustomPaint(
                 size: Size(300, 300),
                 painter: ChartCircle(),
                 child: Center(
                   child: Text("2:45 \n pm",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: TEXT_REGULAR_EXTRA,
                     fontWeight: FontWeight.w400,
                   ),
                   ),
                 ),
               ),
             ),
           ),
         ),


         Positioned(
            bottom: 22,
           left: 0,
           right: 0,
           child: Column(
             children: [
               PatientListView(
                   onClick: (){},
                   isHomePage: false,
                   time: "8:30 AM - 02:00 PM",
                   label: "Confirmed",
                   homePageTitle: "",
                   number: 0,
                   detailPageTitle: "Teeth Drilling",
                   detailParagraph: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                   detailName: "Author Qayhour",
                   itemCount: 10,
                   dotsPosition: (index){
                     setState(() {
                        position = index.toDouble();
                     });
                   },
                   ),
                   SizedBox(height: 12,),
                   DotsIndicator(
               dotsCount: 10,
            position: position,
             decorator: DotsDecorator(
               activeColor: PRIMARY_COLOR,
                  size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
             ],
           ),
         ),


        ],
      ),
    );
  }
}

class ChartCircle extends CustomPainter{


 var points = [
   Offset(150, 60),

   Offset(194, 74),
   Offset(226, 104),

   Offset(240, 152),

   Offset(230, 192),
   Offset(196, 226),

   Offset(150, 240),

   Offset(100, 224),
   Offset(70, 194),

   Offset(60, 152),

   Offset(70, 102),
   Offset(106, 72),
      ];

  @override
  void paint(Canvas canvas, Size size) {

    var paintOne = Paint()
    ..strokeWidth = 14.0
    ..color = CIRCLE_CHART_OUTER_COLOR
    ..style = PaintingStyle.stroke;

     var paintTwo = Paint()
    ..strokeWidth = 54.0
    ..color = CIRCLE_CHART_MIDDLE_COLOR
    ..style = PaintingStyle.stroke;

    var paintThree = Paint()
    ..strokeWidth = 2.0
    ..color = PRIMARY_COLOR
    ..style = PaintingStyle.fill;

    var paintFour = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

    var notiPaintOuter = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.white
    ..style = PaintingStyle.stroke;

     var notiPaintInner = Paint()
    ..strokeWidth = 4.0
    ..color = NOTI_INNER_COLOR
    ..style = PaintingStyle.fill;

     var underNotiPainter = Paint()
    ..strokeWidth = 4.0
    ..color = Colors.white
    ..style = PaintingStyle.fill;


    canvas.drawCircle(Offset(size.width /2, size.height / 2), 120, paintOne);
    canvas.drawCircle(Offset(size.width /2, size.height / 2), 86, paintTwo);
    canvas.drawPoints(ui.PointMode.points, points, paintFour);
    canvas.drawCircle(Offset(size.width /2, size.height / 2), 68, paintThree);

    canvas.drawLine( Offset(240, 152), Offset(284, 152), paintFour);


    canvas.drawCircle(Offset(40,200), 24, notiPaintOuter);
    canvas.drawCircle(Offset(40,200), 22, notiPaintInner);

final tooth = FontAwesomeIcons.tooth.codePoint;
final toothFontPackage = FontAwesomeIcons.tooth.fontPackage;
final toothFontFamily = FontAwesomeIcons.tooth.fontFamily;
TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
textPainter.text = TextSpan(
    text: String.fromCharCode(tooth),
    style: TextStyle(
        fontSize: 30.0,
        fontFamily: toothFontFamily,
        package: toothFontPackage));
        textPainter.layout();
textPainter.paint(canvas, Offset(26,184));
    


    canvas.drawCircle(Offset(150, 270), 24, notiPaintOuter);
    canvas.drawCircle(Offset(150, 270), 22, notiPaintInner);
    
final lightbulb = FontAwesomeIcons.lightbulb.codePoint;
final lightbulbFontPackage = FontAwesomeIcons.lightbulb.fontPackage;
final lightbulbFontFamily = FontAwesomeIcons.lightbulb.fontFamily;
TextPainter textPainter2 = TextPainter(textDirection: TextDirection.rtl);
textPainter2.text = TextSpan(
    text: String.fromCharCode(lightbulb),
    style: TextStyle(
        fontSize: 30.0,
        fontFamily: lightbulbFontFamily,
        package: lightbulbFontPackage));
        textPainter2.layout();
textPainter2.paint(canvas, Offset(138,254));

       
    canvas.drawCircle(Offset(256, 96), 24, notiPaintInner);

    final syringe = FontAwesomeIcons.syringe.codePoint;
final syringeFontPackage = FontAwesomeIcons.syringe.fontPackage;
final syringeFontFamily = FontAwesomeIcons.syringe.fontFamily;
TextPainter textPainter3 = TextPainter(textDirection: TextDirection.rtl);
textPainter3.text = TextSpan(
    text: String.fromCharCode(syringe),
    style: TextStyle(
        fontSize: 30.0,
        fontFamily: syringeFontFamily,
        package: syringeFontPackage));
        textPainter3.layout();
textPainter3.paint(canvas, Offset(242,84));


    
    canvas.drawCircle(Offset(268, 116), 10, underNotiPainter);
    
       final check = FontAwesomeIcons.check.codePoint;
final checkFontPackage = FontAwesomeIcons.check.fontPackage;
final checkFontFamily = FontAwesomeIcons.check.fontFamily;
TextPainter textPainter4 = TextPainter(textDirection: TextDirection.rtl);
textPainter4.text = TextSpan(
    text: String.fromCharCode(check),
    style: TextStyle(
        fontSize: 18.0,
        color: Colors.blue,
        fontFamily: syringeFontFamily,
        package: syringeFontPackage));
        textPainter4.layout();
textPainter4.paint(canvas, Offset(260,107));

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class ClientDataView extends StatelessWidget {
  const ClientDataView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Office No.248",
      style: TextStyle(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      ),
      subtitle: Text("3 patients",
      style: TextStyle(
        fontSize: TEXT_REGULAR,
        color: Colors.white,
      ),
      ),
    );
  }
}

class DetailInfoView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarView(),
        SizedBox(height: MARGIN_MEDIUM_3,),
        
      ],
    );
  }
}

class AppBarView extends StatelessWidget {
  const AppBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ IconButton(
          onPressed: (){
      Navigator.of(context).pop();
        },
         icon: Icon(Icons.arrow_back,size: MARGIN_MEDIUM_4_EXTRA,color: Colors.white,),
         ),
         Padding(
           padding: const EdgeInsets.only(top: MARGIN_SMALL,left: MARGIN_VLARGE,right: MARGIN_LARGE_EXTRA),
           child: Text("Today",
           style: TextStyle(
             color: Colors.white,
             fontSize: TEXT_REGULAR_2X,
             fontWeight: FontWeight.w700,
           ),
           ),
         ),
           IconButton(
          onPressed: (){
      Navigator.of(context).pop();
        },
         icon: Icon(Icons.search,size: MARGIN_MEDIUM_4_EXTRA,color: Colors.white,),
         ),

         IconButton(
          onPressed: (){
      Navigator.of(context).pop();
        },
         icon: Icon(Icons.list_alt,size: MARGIN_MEDIUM_4_EXTRA,color: Colors.white,),
         ),
         ],
    );
  }
}