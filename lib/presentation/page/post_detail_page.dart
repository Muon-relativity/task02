import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task02/presentation/bloc/post_detail_cubit.dart';

import '../bloc/post_detail_state.dart';


class PostDetailPage extends StatelessWidget {
  final int postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    // 상세 데이터를 가져오는 요청
    context.read<PostDetailCubit>().fetchPostDetail(postId);

    return Scaffold(
      appBar: AppBar(title: const Text("Post Detail")),
      body: BlocBuilder<PostDetailCubit, PostDetailState>(
        builder: (context, state) {
          if (state is PostDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostDetailLoaded) {
            final post = state.post;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(post.body, style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (state is PostDetailError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}
