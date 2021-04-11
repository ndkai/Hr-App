import 'package:fai_kul/feature/account_page/component/function_body.dart';
import 'package:fai_kul/feature/account_page/component/header.dart';
import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNar(index: 2),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Header(),
          SizedBox(height: 20,),
          FunctionBody(),
        ],
      ),
    );
  }
}
