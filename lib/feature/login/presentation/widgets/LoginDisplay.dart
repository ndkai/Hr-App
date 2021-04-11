import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:flutter/material.dart';

class LoginDisplay extends StatelessWidget {
    final LoginResponseModel loginResponse;

    const LoginDisplay({
        Key key,
        @required this.loginResponse,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height / 20,
            child: Column(
                children: <Widget>[
                    Text(
                        loginResponse.email.toString(),
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
                        textAlign: TextAlign.end,
                    ),
                ],
            ),
        );
    }
}
