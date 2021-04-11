import 'package:flutter/cupertino.dart';

import 'card.dart';

class StudentTemperature extends StatelessWidget {
  final double temperature;

  const StudentTemperature({Key key, this.temperature}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomCardText(title: "Temperature", number: '$temperature',),
    );
  }
}
