import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task02/core/network/dio_client.dart';
import 'package:task02/data/datasource/post_remote_data_source_impl.dart';
import 'package:task02/data/repositories/post_repository_impl.dart';
import 'package:task02/domain/usecases/get_posts_usecase.dart';
import 'package:task02/domain/usecases/get_post_detail_usecase.dart';
import 'package:task02/presentation/bloc/post_list_cubit.dart';
import 'package:task02/presentation/bloc/post_detail_cubit.dart';
import 'package:task02/presentation/page/post_list_page.dart';

void main() {
  final dioClient = DioClient("https://jsonplaceholder.typicode.com");
  final dataSource = PostRemoteDataSourceImpl(dioClient.dio);
  final repository = PostRepositoryImpl(dataSource);
  final getPostsUseCase = GetPostsUseCase(repository);
  final getPostDetailUseCase = GetPostDetailUseCase(repository);

  runApp(MyApp(
    getPostsUseCase: getPostsUseCase,
    getPostDetailUseCase: getPostDetailUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetPostsUseCase getPostsUseCase;
  final GetPostDetailUseCase getPostDetailUseCase;

  const MyApp({
    super.key,
    required this.getPostsUseCase,
    required this.getPostDetailUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostListCubit(getPostsUseCase: getPostsUseCase),
        ),
        BlocProvider(
          create: (_) => PostDetailCubit(getPostDetailUseCase: getPostDetailUseCase),
        ),
      ],
      child: MaterialApp(
        home: const PostListPage(),
      ),
    );
  }
}
