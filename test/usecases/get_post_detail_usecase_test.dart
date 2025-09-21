import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task02/domain/entities/post.dart';
import 'package:task02/domain/usecases/get_post_detail_usecase.dart';

import '../mocks/mock_post_repository.mocks.dart';

void main() {
  late MockPostRepository mockPostRepository;
  late GetPostDetailUseCase getPostDetailUseCase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostDetailUseCase = GetPostDetailUseCase(mockPostRepository);
  });

  test('should fetch post detail from the repository', () async {
    // Arrange
    final mockPost = Post(id: 1, title: 'Post 1', body: 'Body 1');
    when(mockPostRepository.fetchPostDetail(1)).thenAnswer((_) async => mockPost);

    // Act
    final result = await getPostDetailUseCase(1);

    // Assert
    expect(result, mockPost);
    verify(mockPostRepository.fetchPostDetail(1)).called(1);
    verifyNoMoreInteractions(mockPostRepository);
  });
}
