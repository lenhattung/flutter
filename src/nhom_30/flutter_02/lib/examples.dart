import 'package:flutter/material.dart';
import 'baitap01.dart';

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


/// BottomNavigationBarExample

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

//
class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  // Sử dụng các class có sẵn
  static final List<Widget> _widgetOptions = <Widget>[
    const BorderExample(),
    const CircleAvatarExample(),
    const ProfilePage(),
  ];
  // Hàm xử lý khi tap vào item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('BottomNavigationBar'),
        // ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
          // Index cua item dang duoc chon
          currentIndex: _selectedIndex,
          // Màu của item khi được chọn
          selectedItemColor: Colors.amber[800],
          // Hàm xử lý khi tap vào item
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


///
//
class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Example'),
      ),
      // Sử dụng SingleChildScrollView để cho phép cuộn khi nội dung vượt quá màn hình
      body: SingleChildScrollView(
        // Column chứa danh sách các item
        child: Column(
          children: [
            // Tạo vòng lặp 50 item
            for (int i = 0; i < 50; i++)
              Center(
                child: Text(
                  'Item $i',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//

// ###################
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Example'),
      ),
      // ListView để hiển thị danh sách các ListTile
      body: ListView(
        children: const <Widget>[
          // ListTile với icon bản đồ
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          // ListTile với icon album ảnh
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          // ListTile với icon điện thoại
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}


////////////

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Example'),
      ),
      // GridView.count tạo lưới với số cột cố định
      body: GridView.count(
        // Số cột trong lưới
        crossAxisCount: 2,
        children: <Widget>[
          // Container màu đỏ với Item 1
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('Item 1'),
            ),
          ),
          // Container màu xanh lá với Item 2
          Container(
            color: Colors.green,
            child: const Center(
              child: Text('Item 2'),
            ),
          ),
          // Container màu xanh dương với Item 3
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Item 3'),
            ),
          ),
          // Container màu vàng với Item 4
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text('Item 4'),
            ),
          ),
        ],
      ),
    );
  }
}

class GridPage2 extends StatelessWidget {
  const GridPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Example'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Số cột
        mainAxisSpacing: 10.0, // Khoảng cách giữa các hàng
        crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
        padding: const EdgeInsets.all(10.0), // Padding cho toàn bộ grid
        children: <Widget>[
          // Ảnh 1
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
          // Ảnh 2
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://picsum.photos/201',
              fit: BoxFit.cover,
            ),
          ),
          // Ảnh 3
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://picsum.photos/202',
              fit: BoxFit.cover,
            ),
          ),
          // Ảnh 4
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://picsum.photos/203',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class GridPage3 extends StatelessWidget {
  const GridPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Demo'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3, // Tăng lên 3 cột
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.8, // Điều chỉnh tỷ lệ chiều cao/rộng của item
        children: List.generate(5, (index) {
          return Card(
            child: Column(
              children: [
                // Ảnh laptop
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.network(
                      'https://picsum.photos/200', // URL ảnh laptop
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Phần text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'name ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'title ${index + 1}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}