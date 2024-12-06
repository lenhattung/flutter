import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Example'),
      ),
      body: Center(
        child: Text(
          'My name is Tung',
          style:  TextStyle(
            fontSize: 24,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            print('Ban da nhan vao nut ... ');
          },
          child: Icon(Icons.access_alarm)),
    );
  }

}