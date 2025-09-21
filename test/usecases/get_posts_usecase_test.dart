import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task02/domain/entities/post.dart';
import 'package:task02/domain/usecases/get_posts_usecase.dart';

import '../mocks/mock_post_repository.mocks.dart';

void main() {
  late MockPostRepository mockPostRepository;
  late GetPostsUseCase getPostsUseCase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostsUseCase = GetPostsUseCase(mockPostRepository);
  });

  test('should fetch posts from the repository', () async {
    // Arrange
    final mockPosts = [
      Post(id: 1, title: 'Post 1', body: 'Body 1'),
      Post(id: 2, title: 'Post 2', body: 'Body 2'),
    ];
    when(mockPostRepository.fetchPosts()).thenAnswer((_) async => mockPosts);

    // Act
    final result = await getPostsUseCase();

    // Assert
    expect(result, mockPosts);
    verify(mockPostRepository.fetchPosts()).called(1);
    verifyNoMoreInteractions(mockPostRepository);
  });
}
