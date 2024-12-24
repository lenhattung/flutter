// Bước 1: Thêm dependency vào pubspec.yaml
// dependencies:
//   get: ^4.6.6
//   flutter:
//     sdk: flutter

// Bước 2: Chạy lệnh trong terminal
// flutter pub add get
// hoặc
// flutter pub get

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bước 3: Tạo Controller
class CounterController extends GetxController {
  // Biến observable với Rx
  final _counter = 0.obs;

  // Getter để truy cập giá trị
  int get counter => _counter.value;

  // Methods để update state
  void increment() {
    _counter.value++;
  }

  void decrement() {
    if (_counter.value > 0) {
      _counter.value--;
    }
  }

  void reset() {
    _counter.value = 0;
  }
}
/*
// Bước 4: Cập nhật Main App với GetMaterialApp
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Thay MaterialApp bằng GetMaterialApp
      title: 'Counter App with GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}
*/
// Bước 5: Implement Counter Screen với GetX
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller với Get.put()
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with GetX'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.reset,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Count:',
              style: TextStyle(fontSize: 20),
            ),
            // Obx để observe thay đổi
            Obx(
                  () => Text(
                '${controller.counter}',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: controller.increment,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Bước 6 (Tùy chọn): Sử dụng GetX Widget
class AlternativeCounterScreen extends StatelessWidget {
  const AlternativeCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alternative Counter'),
      ),
      body: Center(
        child: GetX<CounterController>(
          init: CounterController(), // Khởi tạo controller
          builder: (controller) {
            return Text(
              'Count: ${controller.counter}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}

// Bước 7 (Tùy chọn): Sử dụng GetBuilder cho performance
class PerformanceCounterScreen extends StatelessWidget {
  const PerformanceCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<CounterController>(
          init: CounterController(),
          builder: (controller) {
            return Text('Count: ${controller.counter}');
          },
        ),
      ),
    );
  }
}

// Bước 8 (Tùy chọn): Sử dụng Route Management của GetX
class GetXRouteExample extends StatelessWidget {
  const GetXRouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigation với GetX
        Get.to(() => const CounterScreen());

        // Hoặc named routes
        // Get.toNamed('/counter');
      },
      child: const Text('Go to Counter'),
    );
  }
}

// Bước 9 (Tùy chọn): Sử dụng Dependency Injection
class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}

// Bước 10 (Tùy chọn): Sử dụng GetX Utilities
void showCounterDialog() {
  Get.defaultDialog(
    title: 'Counter Info',
    middleText: 'Current count is ${Get.find<CounterController>().counter}',
    confirm: TextButton(
      onPressed: () => Get.back(),
      child: const Text('OK'),
    ),
  );
}

void showCounterSnackbar() {
  Get.snackbar(
    'Counter Updated',
    'New value: ${Get.find<CounterController>().counter}',
    snackPosition: SnackPosition.BOTTOM,
  );
}