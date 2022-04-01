import 'package:dental_app/pages/tabs/home_tab.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/resources/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

late TabController _tabController;

@override
  void initState() {

      _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          CalendarTab(),
          Container(color: Colors.green,),
          Container(color: Colors.blue,),
          Container(color: Colors.red, ),
        ],
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: FLOATING_BUTTON_WIDTH,
        height: FLOATING_BUTTON_HEIGHT,
        child: FloatingActionButton(
          backgroundColor: BOTTOM_BACKGROUND_COLOR,
          isExtended: true,
          onPressed: (){
            ///ToDo
          },
          child: Icon(Icons.add_circle,color: PRIMARY_COLOR,size: FLOATING_ICON_SIZE,),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: UNSELECTED_BOTTOM_NAV_LABEL_COLOR,
          labelColor: PRIMARY_COLOR,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(child: Icon(Icons.home,size: BOTTOM_NAV_ICON_SIZE,),),
            Tab(child: Icon(Icons.calendar_today_outlined,size: BOTTOM_NAV_ICON_SIZE_2,),),
            Tab(child: Icon(Icons.query_builder_rounded,size: BOTTOM_NAV_ICON_SIZE_2,),),
            Tab(child: Icon(Icons.person,size: BOTTOM_NAV_ICON_SIZE,),),
          ],
      ),
      ),
    );
  }
}