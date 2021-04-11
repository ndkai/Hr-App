
import 'package:fai_kul/feature/login/presentation/manager/login/login_bloc.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Login/components/body.dart';
import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Stack(
        children: <Widget>[Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Body(),
              // Bottom half
            ],
          ),
        )
        ],
      ),
    );
  }
}
