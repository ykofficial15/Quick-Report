// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_report/registration/signup_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:quick_report/components/about.dart';
import 'package:quick_report/components/bottom_navigation.dart';
import 'package:quick_report/components/complaint.dart';
import 'package:quick_report/components/helpline.dart';
import 'package:quick_report/components/lists.dart';
import 'package:quick_report/components/news.dart';
import 'package:quick_report/registration/home_page.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:quick_report/registration/login_screen.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
 }
 class MyApp extends StatelessWidget {
  //  const MyApp({super.key});
   @override
   Widget build(BuildContext context) {
     bool isDarkMode = false;
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
         brightness: isDarkMode ? Brightness.dark : Brightness.light,
         appBarTheme:  AppBarTheme(backgroundColor:isDarkMode ? Colors.blue: Colors.blue),
  primaryColor: Colors.blue,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      color: isDarkMode ? Colors.white : Colors.black, // using ternary operator
    ),),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
  darkTheme: ThemeData.dark(), 
          themeMode: ThemeMode.system,

      home:SplashScreen(
        seconds: 2,
        navigateAfterSeconds:HomePage(),
        title: new Text(
          'Quick Report',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        loadingText: Text(
          'Yogx Technologies',
          style: TextStyle(color: Colors.white, fontSize: 5),
        ),
        image: new Image.asset('assets/splash.png'),
        photoSize: 100.0,
        backgroundColor: Colors.blue,
        loaderColor: Colors.white,
      ),

      routes:{
        '/bottom_navigation': (context) => BottomNavigation(),
        '/complaint': (context) => complaint(),
        '/about': (context) => about(),
        '/helpline': (context) => helpline(),
        '/lists': (context) => lists(),
        '/news': (context) => news(),
        '/login_screen': (context) => LoginScreen(),
         '/signup_page': (context) => SignupPage(),
      },
     );
   }
 }
