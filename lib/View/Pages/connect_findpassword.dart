import 'package:connect/View/UI/login_customtextform.dart';
import 'package:flutter/material.dart';

class FindPasswordPage extends StatefulWidget {
  const FindPasswordPage({super.key, required this.title});
  final String title;

  @override
  State<FindPasswordPage> createState() => _FindPasswordPageState();
}

class _FindPasswordPageState extends State<FindPasswordPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _PhoneNumberController = TextEditingController();
  final TextEditingController _IdContrller = TextEditingController();

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
            children: <Widget>[
              Container(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 30),
                              Text(
                                '과외Time', style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 100),
                              Text('아이디',textAlign: TextAlign.start),
                              Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                child: TextFormField(
                                  controller: _IdContrller,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(),
                                    hintText: '아이디',
                                  ),
                                ),
                              ),
                              SizedBox(height: 50),
                              Text('휴드폰 번호'),
                              Row(
                                children: [
                                  Container(
                                    //key: _formKey,
                                    margin: EdgeInsets.only(left: 30),
                                    child: TextFormField(
                                      maxLength: 11,
                                      controller: _PhoneNumberController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(),
                                        hintText: '-없이 입력',
                                        counterText:'',
                                      ),
                                      validator: (value) => value!.isEmpty
                                          ? "휴대폰 번호를 입력해주세요"
                                          : null,
                                    ),
                                    width: 250,
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary : Color(0xff42A5F5),
                                            elevation: 5,
                                            padding: EdgeInsets.all(10),
                                          ),
                                          onPressed: (){
                                            Navigator.pushNamed(context, "");
                                          },
                                          child: Text("인증요청", style: TextStyle(color: Colors.white, fontSize: 15))
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                child: TextFormField(
                                  controller: _IdContrller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(),
                                    hintText: '인증번호입력',
                                  ),
                                ),
                              ),
                        ],
                      ),
                        )
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Container(
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary : Color(0xff42A5F5),
                                      elevation: 5,
                                      padding: EdgeInsets.only(bottom: 10, top: 10, left: 150,right: 150),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.pushNamed(context, "/login");
                                      print('로그인 페이지');
                                    },
                                    child: Text("로그인",
                                        style:TextStyle(color: Colors.white, fontSize: 20)
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          )

      ),
    );
  }
}