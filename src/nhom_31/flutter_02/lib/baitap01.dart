import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ sơ'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300, // Đặt chiều rộng cố định cho Card
          child: Card(
            //color: Colors.blue, // Màu nền nhạt của Card
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.yellow,
                    backgroundImage: NetworkImage('https://picsum.photos/200/200'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tên người dùng',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email: email@example.com'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.phone),
                      SizedBox(width: 8),
                      Text('Số điện thoại: 0123456789'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}