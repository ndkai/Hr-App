import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      child: Container(
          child: Text(
            message,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.end,
          ),
      ),
    );
  }
}
