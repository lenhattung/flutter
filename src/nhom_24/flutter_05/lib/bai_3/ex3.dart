import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Tạo counter provider model (Mode)
class CounterProvider extends ChangeNotifier{
  int _counter = 0;

  // Getter để đọc giá trị
  int get counter => _counter;

  // cap nhat state
  void increment(){
    _counter++;
    notifyListeners(); // Thông báo cho các widgets đang lắng nghe
  }
  // cap nhat state
  void decrement(){
    if(_counter>0)
      _counter--;
    notifyListeners(); // Thông báo cho các widgets đang lắng nghe
  }
  // cap nhat state
  void reset(){
    _counter=0;
    notifyListeners(); // Thông báo cho các widgets đang lắng nghe
  }
}

// ===============
// Chuyển đổi CounterScreen thành StatelessWidget
class CounterScreen extends StatelessWidget{
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(builder: (context, counterProvider, child){
      return Scaffold(
          appBar: AppBar(
            title:  const Text('Counter App'),
            actions: [
              IconButton(onPressed: () => counterProvider.reset(),
                  icon: const Icon(Icons.refresh)),
            ],
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Curent Counter: '
                    , style: const TextStyle(fontSize: 20),),
                  Text('${counterProvider.counter}', style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),),
                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () => counterProvider.decrement(),
                          child: const Icon(Icons.remove)),
                      const SizedBox(width: 20,),
                      ElevatedButton(onPressed: () => counterProvider.increment(),
                          child: const Icon(Icons.add))
                    ],
                  )
                ],
              )
          )
      );
    });
  }
}