import 'package:flutter/material.dart';
import 'package:subscriptionapp/widget/image_picker.dart';
import 'package:subscriptionapp/widget/registerForm.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register-screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [ShopPicCard(), RegisterForm()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
