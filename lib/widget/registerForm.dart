import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionapp/provider/auth_provider.dart';

import '../home_screen.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _cPasswordTextController = TextEditingController();
  final _addAddressTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _dialogTextController = TextEditingController();
  String email;
  String password;
  String mobile;
  String shopName;
  bool _isLoading = false;

  Future<String> uploadFile(filePath) async {
    File file = File(filePath);

    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      await storage
          .ref('uploads/shopProfilePic/${_nameTextController.text}')
          .putFile(file);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e.code);
    }
    String downloadURL = await storage
        .ref('uploads/shopProfilePic/${_nameTextController.text}')
        .getDownloadURL();
    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthProvider>(context);
    scaffoldMessage(message) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    return _isLoading
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amberAccent),
          )
        : Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Shop Name';
                      }
                      setState(() {
                        _nameTextController.text = value;
                      });
                      setState(() {
                        shopName = value;
                      });
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_business),
                      labelText: 'Business Name',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Phone Number Please';
                      }
                      setState(() {
                        mobile = value;
                      });
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      prefixText: '+7',
                      labelText: 'Enter Your Phone Number ',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
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
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Enter Email ',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    controller: _passwordTextController,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password';
                      }

                      if (value.length < 6) {
                        return 'Minimum 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      labelText: 'Enter Password',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    controller: _cPasswordTextController,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Confirm Password';
                      }
                      if (value.length < 6) {
                        return 'Minimum 6 characters';
                      }
                      if (_passwordTextController.text !=
                          _cPasswordTextController.text) {
                        return 'Password does\'t match';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      labelText: 'Confirm Password',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    maxLines: 6,
                    controller: _addAddressTextController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please press Navigation Button';
                      }
                      if (_authData.shopLatitude == null) {
                        return 'Please press Navigation Button';
                      }
                      setState(() {
                        password = value;
                      });
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.contact_mail_outlined),
                      labelText: 'Business Location',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _addAddressTextController.text =
                              'Locating...\n Please wait..';
                          _authData.getCurrentAddress().then((address) {
                            if (address != null) {
                              setState(() {
                                _addAddressTextController.text =
                                    '${_authData.placeName}\n ${_authData.shopAddress}';
                              });
                            } else {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'We couldn\'t find loaction.. Try again'),
                              ));
                            }
                          });
                        },
                        icon: Icon(Icons.location_searching),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _dialogTextController.text = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.comment),
                      labelText: 'Shop Dialog',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amberAccent, width: 2)),
                      focusColor: Colors.amberAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          if (_authData.isPicAvial == true) {
                            //here the valid of the picture
                            if (_formKey.currentState.validate()) {
                              //here valid the forms
                              setState(() {
                                _isLoading = true;
                              });
                              _authData
                                  .registerVendor(email, password)
                                  .then((credential) {
                                if (credential.user.uid != null) {
                                  uploadFile(_authData.image.path).then((url) {
                                    if (url != null) {
                                      // save vendor details to database
                                      _authData.saveVendorDataToDb(
                                        url: url,
                                        mobile: mobile,
                                        shopName: shopName,
                                        dialog: _dialogTextController.text,
                                      );

                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pushReplacementNamed(
                                          context, HomeScreen.id);
                                    } else {
                                      scaffoldMessage(
                                          'Failed to upload shop Profile pic');
                                    }
                                  });
                                } else {
                                  //register failed
                                  scaffoldMessage(_authData.error);
                                }
                              });
                              // Scaffold.of(context).showSnackBar(SnackBar(
                              //   content: Text('Processing Data'),
                              // )); //ScaffoldMessenger
                            } else {
                              scaffoldMessage(
                                  'Shop profile pic need to be added');
                            }
                          }
                        },
                        color: Colors.amberAccent,
                        child: Text('Register'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
