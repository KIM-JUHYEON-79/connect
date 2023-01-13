import 'dart:async';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key, required this.title});
  final String title;

  @override
  State<IntroPage> createState() => _IntroPageState();
}
@override

class _IntroPageState extends State<IntroPage>{
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5000), () {
      Navigator.of(context).pushNamed('/login');
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(//여기 로고 넣기
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF42A5F5),
                borderRadius: BorderRadius.circular(75)
              ),
            ),
            Text('Connect',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          ],

        ),

      ),

    );
  }
}