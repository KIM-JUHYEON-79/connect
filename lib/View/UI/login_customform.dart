import 'package:flutter/material.dart';
import 'package:connect/View/UI/login_customtextform.dart';
/*import 'package:http/http.dart' as http;

_postRequest() async {

  http.Response response = await http.get(
    Uri.parse('http://110.13.161.122')
  );

  if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  }else{
    throw Exception("Faild!!!!");
  }
}*/

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField("핸드폰번호"),
          SizedBox(height: 10),
          CustomTextFormField("비밀번호"),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary : Color(0xff42A5F5),
                elevation: 5,
                padding: EdgeInsets.only(bottom: 10, top: 10, left: 150,right: 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: ()  async{
             //print( await _postRequest());
             if (_formKey.currentState!.validate()) {
               Navigator.of(context).pushNamed('/welcome');
             }
             },
              child: Text("로그인",
                  style:TextStyle(color: Colors.white, fontSize: 20)
              ),
            ),
          ),
        ],
      ),
    );
  }
}