import 'package:fai_kul/core/utils/input_converter.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/chi_tiet.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/fee.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/lophocs.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/widgets/component/fee_count.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/widgets/component/hearder.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = new NumberFormat("#,###");
class FeeListView extends StatefulWidget {
  final FeeSwagger fee;

  const FeeListView({Key key, this.fee}) : super(key: key);

  @override
  _FeeListViewState createState() => _FeeListViewState();
}

class _FeeListViewState extends State<FeeListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    return Column(
      children: [
        SizedBox(height: 10),
        FeeHeader(feeSwagger: widget.fee,),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, size.height/50),
                blurRadius: 20,
                color: kActiveShadowColor,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          height: size.height * 0.6,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: _buildListItemsFromitems(),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
            )),
           FeeCounting(unPay: widget.fee.data[0].tongHocPhiChuaDong, totalFee: widget.fee.data[0].tongHocPhiDaDong)
      ],
    );
  }



  List<Container> _buildListItemsFromitems() {
    int index = 0;
    List<Container> list = widget.fee.data[0].lstLopHoc.map((item) {
      var container = Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                SizedBox(height:20.0),
                ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${item.tenLopHoc}", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("${formatter.format(item.hocPhi)}đ"),
                    ],
                  ),
                  children: createChildrenTexts(item.chiTiet)
                ),
              ],
            ),
          ),
      );
      return container;
    }).toList();

    Container container = Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: <Widget>[
            SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Khóa học", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text("Học phí", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ],
                ),
          ],
        ),
      ),
    );

    list.insert(0, container);
    return list;
  }

  List<ListTile> createChildrenTexts(List<ChiTiet> list) {
    int sum = 0;
    for(ChiTiet chiTiet in list){
      sum+= chiTiet.soTien;
    }
    ListTile listTile2 = ListTile(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ngày", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Số tiền",style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ));

    ListTile listTile = ListTile(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Đã nộp: ", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("${formatter.format(sum)}đ"),
          ],
    ));
    /// Method 2
    List<ListTile> list2 = list.map((item) => ListTile(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${getTimeByString(item.ngayDong)}"),
            Text("${formatter.format(item.soTien)}đ" ),
          ],
        ),
    ))
        .toList();

    list2.add(listTile);
    list2.insert(0, listTile2);
    return list2;
  }


}
