import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/top_recorder/presentation/widgets/comment_widget.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';

class CommentPage extends StatefulWidget {
  static const String routeName = "CommentPage";
  final double initStart;
  final int id;

  const CommentPage({Key key, this.initStart, this.id}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Đánh giá tiết học'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(key: textGlobalKey,)),
              );
            },
          ),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: CommentWidget(start: widget.initStart, id: widget.id,),
        ));
  }
}

Future<bool> pushComment (
    int id,
    int danhgia,
    String diemdanh,
    String baihoc,
    String baitap,
    String nhanxet) async {

  var body = jsonEncode( {
  'danhGia': danhgia,
  'diemDanh': diemdanh,
  'baiHoc': baihoc,
  'baiTapVeNha': baitap,
  'nhanXet': nhanxet
  });
  print("11111111zzzz${id}");
    http.Client client = http.Client();
    final response = await client
        .put('$mainUrl/v1/NhanVien/giaovien/ghisodaubai/${id}',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json", // k co header la failed 415
          'Authorization': 'Bearer ${appUser.token}',
        },
        body: body);
    print("pushComment${response.statusCode}");
    if(response.statusCode == 200){
      return true;
    }
    return false;
}
