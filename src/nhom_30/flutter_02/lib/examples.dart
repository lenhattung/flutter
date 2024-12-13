import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Example'),
        ),
        body: Center(
          child: Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('This is a card'),
            ),
          ),
        ),
      ),
    );
  }
}


//
class CircleAvatarExample extends StatelessWidget {
  const CircleAvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Circle Avatar Example'),
        ),
        body: Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://picsum.photos/200/200'
            ),
          ),
        ),
      ),
    );
  }
}

//
class BorderExample extends StatelessWidget {
  const BorderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BorderExample'),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 3,
                )
            ),
            child: const Center(
              child: Text('Border Example'),
            ),
          ),
        ),
      ),
    );
  }
}
