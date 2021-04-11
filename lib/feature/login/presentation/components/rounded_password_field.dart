import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/login/presentation/components/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
   var myController = TextEditingController();
   bool isVisible = true;

   void changeVisibility(){
     setState(() {
       isVisible = !isVisible;
     });
   }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isVisible,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          fillColor: Colors.lightBlue,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Material(
                color: Colors.transparent,
              child: InkWell(
                child: Icon(
                  isVisible? Icons.visibility: Icons.visibility_off,
                  color: kPrimaryColor,
                ),
                onTap: () => {
                    changeVisibility()
                },
              )
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
