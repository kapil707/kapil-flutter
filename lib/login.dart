import 'package:flutter/material.dart';
import 'package:kapil11/uitheme/style.dart';
import 'package:kapil11/widgets/inputs_desions.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  var username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("Enter UserName"),
            MyTextField(
                mytextController: username,
                mylabelText: "UserName",
                myhintText: "Enter UserName....",
                myprefixIcon: Icon(Icons.lock)),
            Container(height: 10),
            Text("Enter Password"),
            MyPasswordTextField(),
            Mybutton(
                btnName: "Login",
                btnIcon: Icon(Icons.lock),
                btnStyle: mTextStyle11(),
                callBack: () {
                  String ue = username.text.toString();
                  print(ue);
                }),
          ],
        ),
      ),
    );
  }
}
