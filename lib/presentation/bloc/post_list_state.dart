import 'package:equatable/equatable.dart';
import '../../domain/entities/post.dart';

abstract class PostListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostListInitial extends PostListState {}

class PostListLoading extends PostListState {}

class PostListLoaded extends PostListState {
  final List<Post> posts;

  PostListLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}

class PostListError extends PostListState {
  final String message;

  PostListError(this.message);

  @override
  List<Object?> get props => [message];
}
