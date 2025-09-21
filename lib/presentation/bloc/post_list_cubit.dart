import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_list_state.dart';
import '../../domain/usecases/get_posts_usecase.dart';

class PostListCubit extends Cubit<PostListState> {
  final GetPostsUseCase getPostsUseCase;

  PostListCubit({required this.getPostsUseCase}) : super(PostListInitial());

  Future<void> fetchPosts() async {
    emit(PostListLoading());
    try {
      final posts = await getPostsUseCase();
      emit(PostListLoaded(posts));
    } catch (e) {
      emit(PostListError(e.toString()));
    }
  }
}
