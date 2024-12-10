import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 7, // Số lượng bài viết
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  'https://picsum.photos/100/100', // URL hình ảnh mẫu
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Bài viết ${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Mô tả ngắn gọn về bài viết ${index + 1}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              onTap: () {
                // Xử lý khi người dùng tap vào bài viết
                print('Tap vào bài viết ${index + 1}');
              },
            ),
          );
        },
      ),
    );
  }
}