import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task02/presentation/bloc/post_detail_state.dart';

import '../../core/app_exception.dart';
import '../../domain/usecases/get_post_detail_usecase.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final GetPostDetailUseCase getPostDetailUseCase;

  PostDetailCubit({required this.getPostDetailUseCase}) : super(PostDetailInitial());

  Future<void> fetchPostDetail(int id) async {
    emit(PostDetailLoading());
    try {
      final post = await getPostDetailUseCase(id);
      emit(PostDetailLoaded(post));
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        emit(PostDetailError('${appError.code}: ${appError.message}'));
      } else {
        emit(PostDetailError(e.message ?? '알 수 없는 네트워크 오류'));
      }
    } catch (e) {
      emit(PostDetailError(e.toString()));
    }
  }
}
