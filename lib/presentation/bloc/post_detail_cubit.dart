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
        emit(PostDetailError(e.error as AppException));
      } else {
        emit(PostDetailError(AppException(message: e.message ?? '알 수 없는 네트워크 오류', code: -1)));
      }
    } catch (e) {
      emit(PostDetailError(AppException(message: e.toString(), code: -1)));
    }
  }
}
