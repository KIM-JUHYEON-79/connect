import 'package:flutter/material.dart';
import '../UI/login_customform.dart';
import '../UI/login_signupbutton.dart';


class LoginPage extends StatelessWidget{
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 120),
                Text('Connect',
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomForm(),
                SizedBox(height: 10),
                SignupButton(),
                SizedBox(height: 10),
                TextButton(onPressed:(){ print('비밀번호찾기페이지');},
                    child: Text(
                        '비밀번호를 잊으셨나요?',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                            color: Color(0xff42A5F5)
                    ))
                )

              ],
            ),

          )
        ],
      ),
    );
  }
}