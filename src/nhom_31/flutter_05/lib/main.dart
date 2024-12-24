import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bai_3/ex3.dart';
//import 'bai_1/ex1.dart';
//import 'bai_2/ex2.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(
    // Đặt Provider ở mức cao nhất để có thể truy cập từ mọi nơi trong app
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
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
      home: const CounterScreen(),
    );
  }
}
