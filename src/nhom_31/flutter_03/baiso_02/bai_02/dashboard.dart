import 'package:flutter/material.dart';
import 'package:flutter_nhom24_api/login.dart';
import 'package:flutter_nhom24_api/models/user.dart';
import 'package:flutter_nhom24_api/services/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _authService = AuthService();
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    final user = await _authService.getUserInfo();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(_user?.name ?? ''),
            Text('Email: ${_user?.email ?? ''}'),
            Text('SĐT: ${_user?.phone ?? ''}'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await _authService.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('Đăng xuất'),
            ),
          ],
        ),
      ),
    );
  }
}