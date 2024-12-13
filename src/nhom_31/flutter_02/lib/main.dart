import 'package:flutter/material.dart';
import 'examples.dart';
import 'baitap01.dart';
import 'baitap02.dart';
import 'baitap03.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examples',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: BaiTap3(),
    );
  }
}

