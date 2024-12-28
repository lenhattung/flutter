// Bước 1: Thêm dependencies vào pubspec.yaml
// dependencies:
//   flutter_bloc: ^8.1.3
//   bloc: ^8.1.2
//   flutter:
//     sdk: flutter

// Bước 2: Chạy lệnh trong terminal
// flutter pub add flutter_bloc bloc
// hoặc
// flutter pub get

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bước 3: Định nghĩa Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}
class ResetEvent extends CounterEvent {}

// Bước 4: Định nghĩa States
class CounterState {
  final int count;

  const CounterState(this.count);
}

// Bước 5: Implement CounterBloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    // Định nghĩa event handlers
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      if (state.count > 0) {
        emit(CounterState(state.count - 1));
      }
    });

    on<ResetEvent>((event, emit) {
      emit(const CounterState(0));
    });
  }
}

/*
// Bước 6: Cập nhật Main App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Wrap với BlocProvider
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterScreen(),
      ),
    );
  }
}
*/
// Bước 7: Implement UI với BlocBuilder
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with BLoC'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Dispatch event to bloc
              context.read<CounterBloc>().add(ResetEvent());
            },
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
            // BlocBuilder để lắng nghe state changes
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
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

// Bước 8 (Tùy chọn): Sử dụng BlocListener và BlocConsumer
class AdvancedCounterScreen extends StatelessWidget {
  const AdvancedCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterBloc, CounterState>(
        // Listener để thực hiện side effects (ví dụ: hiển thị snackbar)
        listener: (context, state) {
          if (state.count == 5) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Wow! You reached 5!')),
            );
          }
        },
        // Builder để build UI
        builder: (context, state) {
          return Center(
            child: Text('Count: ${state.count}'),
          );
        },
      ),
    );
  }
}

// Bước 9 (Best Practice): Tách Events và States vào files riêng
// counter_event.dart
// counter_state.dart
// counter_bloc.dart

// Bước 10 (Testing): Viết tests cho BLoC
// test('counter bloc test', () {
//   final bloc = CounterBloc();
//   expect(bloc.state.count, equals(0));
//
//   bloc.add(IncrementEvent());
//   expect(bloc.state.count, equals(1));
// });