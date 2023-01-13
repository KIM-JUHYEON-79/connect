import 'package:flutter/material.dart';
import 'package:connect/View/Pages/connect_login.dart';

class SignupButton extends StatelessWidget{
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary : Color(0xff42A5F5),
                elevation: 5,
                padding: EdgeInsets.only(bottom: 10, top: 10, left: 140,right: 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, "/signup");
              },
              child: Text("회원가입", style: TextStyle(color: Colors.white, fontSize: 20))
          ),
        )
      ],
    );
  }
}