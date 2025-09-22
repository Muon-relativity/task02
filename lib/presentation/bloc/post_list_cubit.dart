import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app_exception.dart';
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
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        emit(PostListError('${appError.code}: ${appError.message}'));
      } else {
        emit(PostListError(e.message ?? '알 수 없는 네트워크 오류'));
      }
    } catch (e) {
      emit(PostListError(e.toString()));
    }
  }
}
