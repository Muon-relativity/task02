import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task02/presentation/bloc/post_list_cubit.dart';
import 'package:task02/presentation/bloc/post_list_state.dart';
import 'package:task02/presentation/page/post_detail_page.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  PostListPageState createState() => PostListPageState();
}

class PostListPageState extends State<PostListPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final postListCubit = context.read<PostListCubit>();
    if (postListCubit.state is! PostListLoaded) {
      postListCubit.fetchPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: BlocBuilder<PostListCubit, PostListState>(
        builder: (context, state) {
          if (state is PostListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostListLoaded) {
            final posts = state.posts;
            return ListView.separated(
              itemCount: posts.length,
              itemBuilder: (_, i) => ListTile(
                title: Text("${posts[i].id}. ${posts[i].title}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailPage(postId: posts[i].id),
                    ),
                  );
                },
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          } else if (state is PostListError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
