import 'package:task02/domain/entities/post.dart';
import 'package:task02/domain/repositories/post_repository.dart';

class GetPostDetailUseCase {
  final PostRepository repository;

  GetPostDetailUseCase(this.repository);

  Future<Post> call(int id) => repository.fetchPostDetail(id);
}
