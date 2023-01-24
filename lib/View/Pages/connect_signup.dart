import 'package:connect/Model/user.dart';
import 'package:connect/View/UI/signup_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:connect/View/UI/login_signupbutton.dart';

Users user = new Users('','',0,0,0,0,0);

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //약관동의
  bool value = false;
  final allNotifications = CheckBoxState(title: '전체동의');
  final notifications = [
    CheckBoxState(title: '(필수)업비트 개인정보 수집 동의',),
    CheckBoxState(title: '(필수)업비트 개인정보 수집 동의',),
    CheckBoxState(title: '(필수)업비트 개인정보 수집 동의',),
  ];

  //신분 선택
  String? checkIdentity;
  List<String> checkList1 = [
    "선생님",
    "학부모",
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _RegisdentNumberController = TextEditingController();
  final TextEditingController _RegisdentNumberBackController = TextEditingController();
  final TextEditingController _IDController = TextEditingController();
  final TextEditingController _PhoneNumberController = TextEditingController();
  final TextEditingController _PhoneVerify = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입',
            style: TextStyle(color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 30, left: 30,right: 30),
        children: <Widget>[
          Text(
              '과외타임 이용을 위한\n본인인증을 진행합니다.',
              style: TextStyle(color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 5),
          Text('본인 명의의 휴대폰 번호로 인증을\n진행해 주세요.',
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
            //textAlign: TextAlign.start,
          ),
          buildGroupCheckbox(allNotifications),
          Divider(color: Color(0xff42A5F5), thickness: 2, indent: 30, endIndent: 30,),
          ...notifications.map(buildSingleCheckBox).toList(),
          Container(
            padding: EdgeInsets.only(left: 80,right: 80),
            child: Column(
              children: this.checkList1.map<Widget>(
                (String v) => Container(
                  child: CheckboxListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onChanged: (bool? check) => setState(() =>
                    this.checkIdentity = v),
                    title: Text(v),
                    value: this.checkIdentity == v ? true : false,
    ),
              )
              ).toList(),
            ),
          ),
          Container(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('이름', style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _NameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                    hintText: '이름'
                  ),
                  validator: (value) => value!.isEmpty
                      ? "이름을 입력해주세요"
                      : null,
                ),
                SizedBox(height: 10),
                Text('주민등록번호', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(
                      child: TextFormField(
                        maxLength: 6,
                        controller: _RegisdentNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                          hintText: '주민등록번호',
                          counterText:'',
                        ),
                        validator: (value) => value!.isEmpty
                            ? "주민번호을 입력해주세요"
                            : null,
                      ),
                      width: 150,
                    ),
                    Text("      ㅡ      "),
                    Container(
                      child: TextFormField(
                        maxLength: 1,
                        controller: _RegisdentNumberBackController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                          counterText:'',
                        ),
                        validator: (value) => value!.isEmpty
                            ? "주민번호 뒷자리 한자리 수를 입력해주세요"
                            : null,
                      ),
                      width: 40,
                    ),
                    Text("  * * * * * *")
                  ],
                ),
                SizedBox(height: 10),
                Text('아이디', style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _IDController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      hintText: '아이디'
                  ),
                  validator: (value) => value!.isEmpty
                      ? "아이디를 입력해주세요"
                      : null,
                ),
                SizedBox(height: 10),
                Text('휴대폰 번호', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(
                      child: TextFormField(
                        maxLength: 11,
                        controller: _PhoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
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
                    Expanded(
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
                    )
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _PhoneVerify,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '인증번호 입력'
                  ),
                  validator: (value) => value!.isEmpty
                      ? "인증번호를 입력해주세요"
                      : null,
                ),
                SizedBox(height: 10),
                Text('비밀번호', style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _PasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '비밀번호를 입력해주세요'
                  ),
                  validator: (value) => value!.isEmpty
                      ? "비밀번호를 입력해주세요"
                      : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '비밀번호를 재입력해주세요'
                  ),
                  validator: (value)  {
                    if (value != _PasswordController) {
                      return "비밀번호가 일치하지 않습니다.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary : Color(0xff42A5F5),
                      elevation: 5,
                      padding: EdgeInsets.only(bottom: 10, top: 10, left: 140,right: 140),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed('/login', arguments: user);

                        user.checkIdentity = checkList1.toString();
                        user.name = _NameController.text;
                        user.RegisdentNumber = int.parse(_RegisdentNumberController.text) ;
                        user.ResidentBackNumber = int.parse(_RegisdentNumberBackController.text) ;
                        user.ID = int.parse(_IDController.text);
                        user.PhoneNumber = int.parse(_PhoneNumberController.text);
                        user.Password = int.parse(_PasswordController.text);
                      }
                  /*    else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('미입력 값이 있습니다.'),
                              duration: Duration(seconds: 2),
                            )
                        );
                      }*/
                    },
                    child: Text("로그인", style: TextStyle(color: Colors.white, fontSize: 20))
                ),
                SizedBox(height: 10),

              ],
            ),
          )

        ],

      ),
    );
  }



  Widget buildSingleCheckBox(CheckBoxState checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title,
            style: TextStyle(fontSize: 15)),
        onChanged: (value) => setState(() {
          checkbox.value = value!;
          allNotifications.value = notifications.every((notifications) => notifications.value);
        }),
      );

  Widget buildGroupCheckbox(CheckBoxState checkbox) =>
      CheckboxListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title,
            style: TextStyle(fontSize: 18)),
        onChanged: toggleGroupCheckbox,
      );

  void toggleGroupCheckbox(bool? value){
    if(value == null) return;
    setState(() {
      allNotifications.value = value;
      notifications.forEach((notifications) => notifications.value = value);
    });
  }
}
