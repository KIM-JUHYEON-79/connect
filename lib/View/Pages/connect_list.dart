import 'package:flutter/material.dart';
import 'package:connect/Model/class.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connect/View/UI/list_classTile.dart';


class ListPage extends StatefulWidget {
  ListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  State<ListPage> createState() => _ListPageState();
}
// final TextEditingController myController = new TextEditingController();
@override

class _ListPageState extends State<ListPage>{
  AddClass classes = new AddClass('',0 ,0 );
  /*String name = '';
  double frequency= 0;
  double pay = 0;

  List<AddClass> classes = [];*/

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ClassNameController = TextEditingController();
  final TextEditingController _FrequencyController = TextEditingController();
  final TextEditingController _PayController = TextEditingController();

  Widget build(BuildContext context){
    AddClass classes = ModalRoute.of(context)!.settings.arguments as AddClass;

    return Scaffold(
      appBar: AppBar(
          title: Text('과외time'),
          backgroundColor: Color(0xff42A5F5),
          centerTitle: true,
          automaticallyImplyLeading: false
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        itemBuilder: (_, index){
                          return ClassTile(classes);
                        },
                     // itemCount: classes.length,
                    ),
                    
                  )
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  key: _formKey,
                  child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(onPressed: () {
                                showDialog(context: context, builder: (_){
                                  return AlertDialog(
                                    title: const Text('정보를 기입해주세요',
                                      style: TextStyle(fontWeight: FontWeight.bold),),
                                    actions: <Widget>[
                                      TextFormField(
                                        controller : _ClassNameController,
                                        onChanged: (value1){
                                          setState((){
                                            _ClassNameController.text = value1;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: '교실이름',
                                            hintText: "ex)김승찬학생수업",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      TextFormField(
                                          controller : _FrequencyController,
                                          onChanged: (value2){
                                            setState((){
                                              _FrequencyController.text = value2;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: '정산주기횟수',
                                            hintText: "ex)8",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          )),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        controller : _PayController,
                                        onChanged: (value3){
                                          setState((){
                                            _PayController.text = value3;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: '시급',
                                            hintText: "ex)10000",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            )
                                        ),),
                                      SizedBox(height: 80),
                                      ElevatedButton(style: ElevatedButton.styleFrom(
                                        backgroundColor : Color(0xff42A5F5),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(40),),),
                                        onPressed: (){
                                          /*setState(() {
                                           AddClass(
                                             classes.name,
                                             classes.frequency,
                                             classes.pay
                                           );
                                           classes.add(AddClass(
                                               name,
                                               frequency,
                                               pay));

                                           Navigator.pushNamed(context, '/list', arguments: classes);
                                         });*/
                                          if (_formKey.currentState!.validate()) {
                                            classes.classname = _ClassNameController.text;
                                            classes.frequency = int.parse(_FrequencyController.text) ;
                                            classes.pay = int.parse(_PayController.text) ;

                                            Navigator.pushNamed(context,
                                                '/list',
                                                arguments: classes);}},
                                        child: Text('교실생성'),
                                      )

                                    ],

                                  );
                                });
                              },
                                style: ElevatedButton.styleFrom(
                                  primary : Color(0xff42A5F5),
                                  elevation: 5,
                                  padding: EdgeInsets.only(bottom: 10, top: 10, left: 140,right: 140),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                child: Text('교실 추가하기 +'),
                              ),
                            )
                          ],
                        ) ,
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



