import 'package:fai_kul/feature/tuition_fee/domain/entities/fee.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/lophocs.dart';
import 'package:flutter/material.dart';

class CusExpantionTile extends StatefulWidget {
  final LstLopHoc fee;

  const CusExpantionTile({Key key, this.fee}) : super(key: key);
  @override
  _ExpantionTileState createState() => _ExpantionTileState();
}

class _ExpantionTileState extends State<CusExpantionTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.fee.tenLopHoc}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                "Title",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: createChildrenTexts(),
                ),
                ListTile(
                  title: Text('data'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  var list = ["one", "two", "three", "four"];
  List<ListTile> createChildrenTexts() {
    /// Method 1
//    List<Text> childrenTexts = List<Text>();
//    for (String name in list) {
//      childrenTexts.add(new Text(name, style: new TextStyle(color: Colors.red),));
//    }
//    return childrenTexts;

    /// Method 2
    return list.map((text) => ListTile(title:Text('asdasdsd'))).toList();
  }
}
