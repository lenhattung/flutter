import 'package:flutter/material.dart';
import 'package:flutter_nhom24_api/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String KEY_EMAIL = 'email';
  static const String KEY_PHONE = 'phone';
  static const String KEY_NAME = 'name';
  static const String KEY_IS_LOGGED_IN = 'isLoggedIn';

  // Lưu thông tin đăng nhập
  Future<void> saveUserLogin(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_EMAIL, user.email);
    await prefs.setString(KEY_PHONE, user.phone);
    await prefs.setString(KEY_NAME, user.name);
    await prefs.setBool(KEY_IS_LOGGED_IN, true);
  }

  // Kiểm tra trạng thái đăng nhập
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KEY_IS_LOGGED_IN) ?? false;
  }

  // Lấy thông tin người dùng
  Future<User?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(KEY_EMAIL);
    final phone = prefs.getString(KEY_PHONE);
    final name = prefs.getString(KEY_NAME);

    if (email != null && phone != null && name != null) {
      return User(
        email: email,
        phone: phone,
        name: name,
      );
    }
    return null;
  }

  // Đăng xuất
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}