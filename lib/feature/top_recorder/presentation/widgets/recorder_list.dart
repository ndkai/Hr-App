import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/comment_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/widgets/rating_star.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

GlobalKey<_RecorderListState> recoderListState = GlobalKey<
    _RecorderListState>();

class RecorderList extends StatefulWidget {
  final TopRecorderSwagger data;
  final int state;

  const RecorderList({Key key, this.data, this.state}) : super(key: key);

  @override
  _RecorderListState createState() => _RecorderListState();
}

class _RecorderListState extends State<RecorderList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    ScrollController _controller = new ScrollController();
    return Container(
        height: size.height * 0.8,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: _buildListItemsFromitems(widget.data.data),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          controller: _controller,
        ));
  }


  List<Container> _buildListItemsFromitems(List<TopRecorder> list) {
    list = list.reversed.toList();
    print("_buildListItemsFromitems state ${widget.state}");
    if(widget.state == 0){
      list.removeWhere((element) => element.danhGia > 0);
    }
    else{
      list.removeWhere((element) => element.danhGia < 1);
    }
    int index = 0;
    return list.map((item) {
      DateTime dateTime = DateTime.parse(item.ngay);
      print("_buildListItemsFromitems${item.id}");
      var container = Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 30),
                blurRadius: 20,
                color: kActiveShadowColor,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   height: 50,
                  //   width: 50,
                  //   margin: new EdgeInsets.all(10.0),
                  //   child:Image.asset("assets/icons/check_in_icon.png")
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Container(
                              child: Center(
                                child: new Text(
                                  '${item.lopHoc.tenLopHoc}',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.black),
                                ),
                              )
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Container(
                              child: Center(
                                child: new Text(
                                  '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                      color: Colors.black),
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Center(
                          child: RatingWidget(start: item.danhGia.toDouble(),
                            onChanged: (int) => {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => CommentPage(initStart: int, id: item.id,),
                            ),
                            )
                          },)
                      )
                  )
                ],
              ),
            ],
          )
      );
      index = index + 1;
      return container;
    }).toList();
  }
}
