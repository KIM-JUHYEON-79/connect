import 'package:connect/View/Pages/connect_list.dart';
import 'package:flutter/material.dart';
import 'package:connect/View/Pages/connect_intro.dart';
import 'package:connect/View/Pages/connect_login.dart';
import 'package:connect/View/Pages/connect_welcome.dart';
import 'package:connect/View/Pages/connect_signup.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'View/Pages/connect_findpassword.dart';



void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => IntroPage(title: 'intro'),
        '/login' : (context) => LoginPage(title: 'login'),
        '/welcome' : (context) => WelcomePage(title: 'welcome'),
        '/list' : (context) => ListPage(title : 'list'),
        '/signup':(context) => SignUpPage(title:'sign up'),
        '/findpassword' : (context) => FindPasswordPage(title: 'findpassword'),


      },
    );
  }
}