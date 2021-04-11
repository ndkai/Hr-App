import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
final formatter = new NumberFormat("#,###");
class FeeCounting extends StatefulWidget {
  final double totalFee;
  final double unPay;

  const FeeCounting({Key key, this.totalFee, this.unPay}) : super(key: key);
  @override
  _FeeCountingState createState() => _FeeCountingState();
}

class _FeeCountingState extends State<FeeCounting> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
        ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: size.height*0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Đã nộp:", style: TextStyle(color: Colors.black, fontSize: size.height*0.03),),
              Text("${formatter.format(widget.totalFee)}đ", style: TextStyle(color: Colors.black, fontSize: size.height*0.03))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Chưa nộp:", style: TextStyle(color: Colors.black, fontSize: size.height*0.03)),
              Text("${formatter.format(widget.unPay)}đ", style: TextStyle(color: Colors.black, fontSize: size.height*0.03))
            ],
          ),
        ],
      ),
    );
  }
}
