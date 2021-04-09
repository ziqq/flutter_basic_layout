import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:flutter_basic_layout/datamodels/post.dart';
import 'package:flutter_basic_layout/datamodels/user.dart';
import 'package:flutter_basic_layout/datamodels/comment.dart';

@lazySingleton
class Api {
  static const endPoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];
    var response =
        await client.get(Uri.parse('$endPoint/comments?postId=$postId'));
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = [];
    var response =
        await client.get(Uri.parse('$endPoint/posts?userId=$userId'));
    print('response:$response');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<User> getUserProfile(int userId) async {
    var response = await client.get(Uri.parse('$endPoint/users/$userId'));
    return User.fromJson(json.decode(response.body));
  }
}
