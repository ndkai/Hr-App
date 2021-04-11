import 'package:fai_kul/feature/tuition_fee/presentation/manager/fee/fee_bloc.dart';
import 'package:fai_kul/main/constant/slider_items.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../injection_container.dart';
import 'component/body.dart';
import 'component/fee_count.dart';
import 'component/hearder.dart';

class FeePage extends StatelessWidget {
  static const String routeName = '/FeePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khóa học'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(key: textGlobalKey,)),
            );
          },
        ),
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child:  buildBody(context),
      ));
  }

  BlocProvider<FeeBloc> buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<FeeBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
               Container(
                 child: FeeBody(),
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("assets/images/blue_bg3.jpg"),fit: BoxFit.fill)
                 ),
                 height: size.height,
               ), // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}
