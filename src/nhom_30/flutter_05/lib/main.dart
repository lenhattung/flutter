import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'bai_1/ex1.dart';
//import 'bai_2/ex2.dart';
//import 'bai_5/ex5.dart';
import 'package:provider/provider.dart';
import 'bai_3/ex3.dart';

// void main() {
//   runApp(const MyApp());
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  CounterScreen(),
//     );
//   }
// }


//=== GetX
// void main() {
//   runApp(const MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  CounterScreen(),
//     );
//   }
// }

void main() {
  runApp(
//ChangeNotifierProvider cung cấp trạng thái Counter cho toàn bộ ứng dụng
    ChangeNotifierProvider(
      create: (context) => CounterProvider(), // Khởi tạo trạng thái Counter
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  CounterScreen(),
    );
  }
}