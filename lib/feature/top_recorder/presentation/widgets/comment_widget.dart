import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/comment_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/widgets/rating_star.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  final double start;
   final int id;
  const CommentWidget({Key key, this.start, this.id}) : super(key: key);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  String sendState = "";
  double starState = 0;
  TextEditingController attendanceInfoCt;
  TextEditingController homework;
  TextEditingController lesson;
  TextEditingController comment;
  void setSendState(String s){
   setState(() {
     sendState = s;
   });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    starState = widget.start;
    return Column(
      children: [
        Center(
          child: Text("Bạn cảm thấy tiết học như thế nào?"),
        ),
        Container(
            margin: EdgeInsets.only(left: 10, right: 10),
          height: size.height * 0.83,
          child: column(size)
        ),
        sendState == ""?Container(
          height: size.height * 0.05,
          margin: EdgeInsets.only(left: 20, right: 20),
          color: Colors.blue,
          width: size.width,
          child: MaterialButton(
            child: Text(
              "Gửi",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              setSendState("loading");
              bool result = await pushComment(widget.id, starState.round() , attendanceInfoCt.value.text,
                  lesson.value.text, homework.value.text, comment.value.text);
              print("as1dasdaw12312");
              if(result == true){
                showCommentDialog("Đánh giá thành công");
                  setSendState("loaded");
              } else{
                showCommentDialog("Lỗi");
                setSendState("failed");
              }
            },
          ),
        )
        : sendState == 'loading'?LoadingWidget()
            : sendState == "loaded"?Container(
          height: size.height * 0.05,
          margin: EdgeInsets.only(left: 20, right: 20),
          color: Colors.blue,
          width: size.width,
          child: MaterialButton(
            child: Text(
              "Gửi",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              setSendState("loading");
              bool result = await pushComment(widget.id, starState.round() , attendanceInfoCt.value.text,
                  lesson.value.text, homework.value.text, comment.value.text);
              if(result == true){
                setSendState("loaded");
              } else{
                setSendState("failed");
              }
            },
          ),
        ):Container(
          height: size.height * 0.05,
          margin: EdgeInsets.only(left: 20, right: 20),
          color: Colors.blue,
          width: size.width,
          child: MaterialButton(
            child: Text(
              "Gửi",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              setSendState("loading");
              bool result = await pushComment(widget.id, starState.round() , attendanceInfoCt.text,
                  lesson.text, homework.text, comment.text);
              if(result == true){
                setSendState("loaded");
              } else{
                setSendState("failed");
              }
            },
          ),
        ),
      ],
    );
  }

  Widget column(Size size) {
     attendanceInfoCt = TextEditingController();
     lesson = TextEditingController();
     homework = TextEditingController();
     comment = TextEditingController();
     String attitude  = "";
    return Column(
      children: [
        // Center(
        //   child: starState<=1?Text("Kém",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: size.height * 0.03,
        //           fontWeight: FontWeight.bold))
        //   :starState<=2?
        //   Text("Bình thường",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: size.height * 0.03,
        //           fontWeight: FontWeight.bold))
        //   :starState<=3?
        //   Text("Khá",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: size.height * 0.03,
        //           fontWeight: FontWeight.bold))
        //   :starState<=4?Text("Tốt",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: size.height * 0.03,
        //           fontWeight: FontWeight.bold))
        //   :starState<=5?Text("Rất tốt",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: size.height * 0.03,
        //           fontWeight: FontWeight.bold)):
        //   Text("Rất tốt",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: size.height * 0.03,
        //           fontWeight: FontWeight.bold)),
        // ),
        SizedBox(height: 20,),
        Center(
          child: RatingWidget(
            start: widget.start,
            onChanged: (val){
              this.setState(() {
                starState = val;
              });
            },
          ),
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: 'Thông tin điểm danh',
          ),
          controller: attendanceInfoCt,
          maxLines: 4,
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: 'Bài học',
          ),
          controller: lesson,
          maxLines: 4,
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: 'Bài tập về nhà',
          ),
          controller: homework,
          maxLines: 4,
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: 'Nhận xét',
          ),
          controller: comment,
          maxLines: 5,
        ),
      ],
    );
  }

  void showCommentDialog(String s) {
    print("showCommentSuccess");
    var alert = new AlertDialog(
      backgroundColor: Colors.white,
      title: Text(s),
      actions: <Widget>[
        new FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, PageRoutes.recorderTabs);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

}
