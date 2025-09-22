import 'package:equatable/equatable.dart';
import '../../core/app_exception.dart';
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
  final AppException exception;

  PostListError(this.exception);

  @override
  List<Object?> get props => [exception];
}