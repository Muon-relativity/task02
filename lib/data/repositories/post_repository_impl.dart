import 'package:task02/data/datasource/post_remote_data_source.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> fetchPosts() {
    return remoteDataSource.fetchPosts();
  }

  @override
  Future<Post> fetchPostDetail(int id) {
    return remoteDataSource.fetchPostDetail(id);
  }
}
