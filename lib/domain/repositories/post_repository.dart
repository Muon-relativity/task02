import 'package:task02/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<Post> fetchPostDetail(int id);
}
