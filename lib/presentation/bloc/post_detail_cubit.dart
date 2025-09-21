import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task02/presentation/bloc/post_detail_state.dart';

import '../../domain/usecases/get_post_detail_usecase.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final GetPostDetailUseCase getPostDetailUseCase;

  PostDetailCubit({required this.getPostDetailUseCase}) : super(PostDetailInitial());

  Future<void> fetchPostDetail(int id) async {
    emit(PostDetailLoading());
    try {
      final post = await getPostDetailUseCase(id);
      emit(PostDetailLoaded(post));
    } catch (e) {
      emit(PostDetailError(e.toString()));
    }
  }
}
