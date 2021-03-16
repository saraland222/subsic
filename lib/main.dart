import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionapp/home_screen.dart';
import 'package:subscriptionapp/provider/auth_provider.dart';
import 'package:subscriptionapp/screen/login_screen.dart';
import 'package:subscriptionapp/screen/register_screen.dart';
import 'package:subscriptionapp/screen/splash_screen.dart';
import 'package:subscriptionapp/widget/rest_password.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      Provider(
        create: (_) => AuthProvider(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      builder: EasyLoading.init(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RestPassword.id: (context) => RestPassword(),
      },
    );
  }
}
