import 'package:fai_kul/feature/camera/face_detection_camera.dart';
import 'package:fai_kul/feature/login/presentation/components/already_have_an_account_acheck.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_input_field.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_password_field.dart';
import 'package:fai_kul/feature/login/presentation/manager/login/login_bloc.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Signup/signup_screen.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Welcome/welcome_screen.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import '../../../../../../main.dart';
import '../../LoginDisplay.dart';
import '../../loading_widget.dart';
import '../../message_display.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is Empty) {
        isLogin();
      } else if (state is LoginAlready) {
        appUser = getCurrentUser();
        print("asdasd ${appUser.displayName}");
        print("asdasd ${appUser.token}");
        print("asdasd ${appUser.idNhanVien}");
        return HomePage(
          key: textGlobalKey,
        );
      } else if (state is Loaded) {
        appUser = state.loginResponse;
        return HomePage(
          key: textGlobalKey,
        );
      }
      if (state is Loading) {
        return LoadingWidget();
      } else if (state is Error) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/kidkul_logo.png",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  clear;
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  clear;
                  pass = value;
                },
              ),
              Text('Something went wrong, try again!',
                  style: TextStyle(color: Colors.red)),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  login();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      } else if (state is NotLogin) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/kidkul_logo.png",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  clear;
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  clear;
                  pass = value;
                },
              ),
              Text('', style: TextStyle(color: Colors.red)),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  login();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }
    }));
  }

  void login() {
    BlocProvider.of<LoginBloc>(context).add(LoginE(email, pass));
  }

  void isLogin() {
    BlocProvider.of<LoginBloc>(context).add(IsLogin());
  }

  void clear() {
    BlocProvider.of<LoginBloc>(context).add(ClearE());
  }

  void getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    log("locationx: ${_locationData.latitude}");
    log("locationx: ${_locationData.longitude}");
  }
}
