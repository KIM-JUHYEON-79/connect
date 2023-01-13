import 'package:flutter/material.dart';
import '../../Model/class.dart';
import 'package:connect/View/Pages/connect_welcome.dart';
import 'package:connect/View/Pages/connect_list.dart';

class ClassTile extends StatelessWidget {
  ClassTile(this._classes);

  final AddClass _classes;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(_classes.classname),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
              children:<Widget>[
                Text('수업현황'),
                Text('1/${_classes.frequency}'),
                Text('1*${_classes.pay}')
              ]
          ),
        )
    );
  }
}