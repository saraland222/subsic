import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionapp/provider/auth_provider.dart';
import 'package:subscriptionapp/screen/login_screen.dart';

class RestPassword extends StatefulWidget {
  static const String id = 'rest-screen';
  @override
  _RestPasswordState createState() => _RestPasswordState();
}

final _formKey = GlobalKey<FormState>();
var _emailTextController = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

String email;
bool _lodaing = false;

class _RestPasswordState extends State<RestPassword> {
  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthProvider>(context);
    // ignore: unused_element
    scaffoldMessage(message) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  // keyboardType: TextInputType.emailAddress,
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
                          borderSide: BorderSide(color: Colors.amberAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amberAccent)),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined)),
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
                              _lodaing = true;
                            });
                            _authData.restPassword(email);
                            //Scaffold.of(context).showSnackBar(SnackBar(
                            //     content: Text(
                            //         'Please check your link to rest link')));
                            final snackBar = SnackBar(
                                content: Text(
                                    'Please check your link to rest link'));
                            scaffoldKey.currentState.showSnackBar(snackBar);
                          }
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.id);
                        },
                        color: Colors.amberAccent,
                        child: _lodaing
                            ? LinearProgressIndicator()
                            : Text('Rest Password'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
