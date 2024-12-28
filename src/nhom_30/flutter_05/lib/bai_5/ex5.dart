import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController{
  var count = 0.obs;

  void incrementCounter() => count++;
  void decrementCounter() => count--;
  void resetCounter()=> count = 0.obs;
}

//=====
class CounterScreen extends StatelessWidget{
  final CounterController c = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(onPressed: c.resetCounter,
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current Count: ',
              style: TextStyle(fontSize: 20),),
            Obx(()=>
                Text('${c.count}',
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: c.decrementCounter,
                    child: const Icon(Icons.remove)),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: c.incrementCounter,
                    child: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}