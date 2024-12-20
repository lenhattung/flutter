// url = https://my-json-server.typicode.com/lenhattung/flutter/posts/
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

class ApiService{

  final String baseUrl = 'https://my-json-server.typicode.com/nhattungle/restapi/posts';

  // Get all posts
  Future<List<Post>> fetchAllPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json)=>Post.fromJson(json)).toList();
    }else{
      throw Exception("Có lỗi khi tải toàn bộ bài viết!");
    }
  }
  // Get single post by ID
  Future<Post> fetchPost(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Có lỗi khi tải chi tiết bài viết');
    }
  }
}