// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String btnName;
  final Icon? btnIcon;
  final Color? bgColor;
  final TextStyle? btnStyle;
  final VoidCallback? callBack;

  Mybutton({
    required this.btnName,
    this.btnIcon,
    this.bgColor = Colors.blue,
    this.btnStyle,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callBack!();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
      ),
      child: btnIcon != null
          ? Row(
              children: [
                btnIcon!,
                Container(width: 11),
                Text(btnName, style: btnStyle)
              ],
            )
          : Text(btnName, style: btnStyle),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController mytextController;
  final String? mylabelText;
  final String? myhintText;
  final Icon? myprefixIcon;
  MyTextField({
    required this.mytextController,
    this.mylabelText,
    this.myhintText,
    this.myprefixIcon,
  });
  @override
  Widget build(Object context) {
    return TextField(
      controller: mytextController,
      decoration: InputDecoration(
        labelText: mylabelText,
        hintText: myhintText,
        prefixIcon: myprefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
          borderSide: BorderSide(
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController mytextController;

  MyPasswordTextField({required this.mytextController});

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.mytextController,
      obscureText: _isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: "Enter UserName....",
        labelText: "Password",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: BorderSide(color: Colors.pink)),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
    );
  }
}

class MyTextSearchField extends StatelessWidget {
  final Function(String) myonChanged;
  final VoidCallback myclearSearchBox;
  final TextEditingController mytextController;
  final String? mylabelText;
  final String? myhintText;
  final Icon? myprefixIcon;
  MyTextSearchField({
    required this.myonChanged,
    required this.mytextController,
    this.mylabelText,
    this.myhintText,
    this.myprefixIcon,
    required this.myclearSearchBox,
  });
  @override
  Widget build(Object context) {
    return TextField(
      onChanged: myonChanged,
      controller: mytextController,
      decoration: InputDecoration(
        labelText: mylabelText,
        hintText: myhintText,
        prefixIcon: myprefixIcon!,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
          borderSide: BorderSide(
            color: Colors.pink,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: myclearSearchBox,
        ),
      ),
    );
  }
}

class IconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  IconButtonWithText({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(height: 8),
          Text(text),
        ],
      ),
    );
  }
}
