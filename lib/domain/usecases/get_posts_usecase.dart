import 'package:task02/domain/entities/post.dart';
import 'package:task02/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<Post>> call() => repository.fetchPosts();
}
