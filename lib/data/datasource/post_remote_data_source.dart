import 'package:task02/domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<List<Post>> fetchPosts();
  Future<Post> fetchPostDetail(int id);
}
