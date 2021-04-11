import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeeHeader extends StatefulWidget {
  final FeeSwagger feeSwagger;

  const FeeHeader({Key key, this.feeSwagger}) : super(key: key);
  @override
  _FeeHeaderState createState() => _FeeHeaderState();
}

class _FeeHeaderState extends State<FeeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 30),
              blurRadius: 20,
              color: kActiveShadowColor,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: info(),
    );
  }


  Widget info(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Học viên: ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${widget.feeSwagger.data[0].tenHocVien}",
                        style: TextStyle(color: Colors.black)),
                  ]),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Mã học viên: ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${widget.feeSwagger.data[0].maHocVien}",
                        style: TextStyle(color: Colors.black)),
                  ]),
                )),
          ],
        ),
      ],
    );
  }
}
