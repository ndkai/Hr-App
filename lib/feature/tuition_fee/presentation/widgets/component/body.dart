import 'dart:math';

import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/fee.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/manager/fee/fee_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fee_list_view.dart';

class FeeBody extends StatefulWidget {
  @override
  _FeeBodyState createState() => _FeeBodyState();
}

class _FeeBodyState extends State<FeeBody> {
  @override
  Widget build(BuildContext context) {
    getFee();
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          BlocBuilder<FeeBloc, FeeState>(
            builder: (context, state){
              if(state is Empty){
                return Center(
                  child: Text("Empty") ,
                );
              } else
              if(state is Loading){
                return Center(
                  child: LoadingWidget() ,
                );
              }  else
              if(state is Loaded){
                // print("Fee body loaded ${state.fee.data[0].lstLopHoc.length}");
                // return FeeListView(list: state.fee.data[0].lstLopHoc);
                return FeeListView(fee: state.fee);
              }   else
                if(state is Error){
                  return Center(
                    child: Text('Empty'),
                  );
                }
            },
          ),
        ],
      )
    );
  }

  void getFee(){
     BlocProvider.of<FeeBloc>(context).add(GetFee());
  }
}
