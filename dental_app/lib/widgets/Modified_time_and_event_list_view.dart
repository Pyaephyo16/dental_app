//https://www.microsoft.com/en-mm/p/digital-colorimeter-precise-pixel-color-picker/9mwt4twc53mh?activetab=pivot:overviewtab



import 'package:dental_app/pages/tabs/home_tab.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ModifiedTimeAndEventListView extends StatefulWidget {
  const ModifiedTimeAndEventListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.refresh,
    required this.endList,
  }) : super(key: key);

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function refresh;
  final Function endList;

  @override
  State<ModifiedTimeAndEventListView> createState() => _ModifiedTimeAndEventListViewState();
}

class _ModifiedTimeAndEventListViewState extends State<ModifiedTimeAndEventListView> {

  var _scrollController = ScrollController();


  @override
  void initState() {
    
    _scrollController.addListener(() {
        if(_scrollController.position.atEdge){
      if(_scrollController.position.pixels == 0){
        print("Scroll List Start");
      }else{
        print("Scroll List End");
          widget.endList();
      }
    }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(

      onRefresh: ()async{
        widget.refresh();
      },

      child: widget.itemCount == 0 ?
       Center(child: Text("Sorry,No movies available for Today",
         style: TextStyle(
           color: Colors.white,
           fontSize: 22,
         ),
         ))
      : ListView.builder(
        controller: _scrollController,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}



