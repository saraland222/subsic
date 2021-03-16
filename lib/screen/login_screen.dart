import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionapp/provider/auth_provider.dart';
import 'package:subscriptionapp/screen/register_screen.dart';
import 'package:subscriptionapp/widget/rest_password.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _emailTextController = TextEditingController();
  var _cPasswordTextController = TextEditingController();
  Icon icon;
  bool _visible = false;
  String email;
  String password;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthProvider>(context);
    scaffoldMessage(message) {
      return Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 140.0,
                        left: 140.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 20),
                          ),
                          //SizedBox(height: 20.0,),
                          Image.asset(
                            'assets/images/logo1.png',
                            height: 140,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Email';
                        }
                        final bool _isValid =
                            EmailValidator.validate(_emailTextController.text);
                        if (!_isValid) {
                          return 'Invalid Email Format';
                        }
                        setState(() {
                          email = value;
                        });
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _cPasswordTextController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Password';
                        }
                        if (value.length < 6) {
                          return 'Minimum 6 characters';
                        }
                        setState(() {
                          password = value;
                        });
                        return null;
                      },
                      obscureText: _visible == false ? true : false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _visible
                              ? Icon(Icons.remove_red_eye_outlined)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _visible = !_visible;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amberAccent)),
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.vpn_key),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amberAccent)),
                        focusColor: Colors.amberAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RestPassword.id);
                          },
                          child: Text('Forget Password'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                _authData
                                    .loginVendor(email, password)
                                    .then((credential) {
                                  if (credential != null) {
                                    setState(() {
                                      _loading = false;
                                    });
                                    Navigator.pushReplacementNamed(
                                        context, HomeScreen.id);
                                  } else {
                                    setState(() {
                                      _loading = false;
                                    });
                                    //Scaffold.of(context).showSnackBar(SnackBar(
                                    ///    content: Text(_authData.error)));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(_authData.error),
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: _loading
                                ? LinearProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black),
                                  )
                                : Text('LOGIN'),
                            color: Colors.amberAccent,
                          ),
                        )
                      ],
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.id);
                      },
                      child: Text('Sign Up'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
