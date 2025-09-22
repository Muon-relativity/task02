import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task02/core/network/dio_client.dart';
import 'package:task02/data/datasource/post_remote_data_source_impl.dart';
import 'package:task02/data/repositories/post_repository_impl.dart';
import 'package:task02/domain/repositories/post_repository.dart';
import 'package:task02/domain/usecases/get_posts_usecase.dart';
import 'package:task02/domain/usecases/get_post_detail_usecase.dart';
import 'package:task02/presentation/bloc/post_list_cubit.dart';
import 'package:task02/presentation/bloc/post_detail_cubit.dart';
import 'package:task02/presentation/page/post_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PostRepository>(
      create: (_) => PostRepositoryImpl(
        PostRemoteDataSourceImpl(
          DioClient("https://jsonplaceholder.typicode.com").dio,
        ),
      ),
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  PostListCubit(getPostsUseCase: GetPostsUseCase(RepositoryProvider.of<PostRepository>(context))),
            ),
            BlocProvider(
              create: (_) => PostDetailCubit(
                  getPostDetailUseCase: GetPostDetailUseCase(RepositoryProvider.of<PostRepository>(context))),
            ),
          ],
          child: MaterialApp(
            home: const PostListPage(),
          ),
        );
      }),
    );
  }
}
