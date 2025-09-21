import 'package:dio/dio.dart';

import '../../domain/entities/post.dart';
import '../mapper/post_mapper.dart';
import 'post_remote_data_source.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await dio.get('/posts');
    final List<dynamic> data = response.data;
    return data.map((e) => PostMapper.fromJson(e)).toList();
  }

  @override
  Future<Post> fetchPostDetail(int id) async {
    final response = await dio.get('/posts/$id');
    return PostMapper.fromJson(response.data);
  }
}
