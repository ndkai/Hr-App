import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../change_pass_api.dart';

class ChangePassPage extends StatefulWidget {
  static const String routeName = "ChangePassPage";

  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  bool isError = true;
  String isLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Đổi mật khẩu"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          key: textGlobalKey,
                        )),
              );
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0, top: 15),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: currentPass,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                decoration: !isError
                    ? InputDecoration(
                        errorText: "Vui lòng kiểm tra lại",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.error,
                        ),
                        labelText: 'Mật khẩu hiện tại',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      )
                    : InputDecoration(
                        // errorText: Error message':"",
                        // border: OutlineInputBorder(),
                        // suffixIcon: Icon(
                        //   Icons.error,
                        // ),

                        labelText: 'Mật khẩu hiện tại',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
              ),
              TextFormField(
                controller: newPass,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                decoration: InputDecoration(

                  labelText: 'Mật khẩu mới',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              isLogin == ""
                  ? RoundedButton(
                      text: "Đổi mật khẩu",
                      color: Colors.blue,
                      press: () async {
                        print("asdasd${currentPass.text}");
                        print("asdasd${newPass.text}");
                        isLogin = "loading";
                        bool result =
                            await changePass(currentPass.text, newPass.text);
                        if (result) {
                          print("lolma $result");
                          setState(() {
                            prefs.setString(SAVE_LOGIN_RESPONSE,'');
                            showSuccessDialog("", context);
                            isError = true;
                            isLogin = "";
                          });
                        } else {
                          print("lolma $result");
                          setState(() {
                            isError = false;
                            isLogin = "";
                          });
                        }
                      },
                    )
                  : isLogin == "loading"
                      ? LoadingWidget()
                      : null
            ],
          ),
        )));
  }

  void showSuccessDialog(String message, BuildContext context) {
    print("change pass dialog");
    var alert = new AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Đổi mật khẩu thành công"),
      actions: <Widget>[
        new FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, PageRoutes.login);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
