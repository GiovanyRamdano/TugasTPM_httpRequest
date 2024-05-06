import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coba/post.dart';
import 'package:coba/users.dart';
import 'package:coba/comment.dart';

class BaseNetwork {
  static final String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<List<Comment>> getComments(int idPost) async {
    final response =
        await http.get(Uri.parse('$baseUrl/posts/$idPost/comments'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
