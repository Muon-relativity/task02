import 'package:equatable/equatable.dart';
import '../../domain/entities/post.dart';

abstract class PostDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostDetailInitial extends PostDetailState {}

class PostDetailLoading extends PostDetailState {}

class PostDetailLoaded extends PostDetailState {
  final Post post;

  PostDetailLoaded(this.post);

  @override
  List<Object?> get props => [post];
}

class PostDetailError extends PostDetailState {
  final String message;

  PostDetailError(this.message);

  @override
  List<Object?> get props => [message];
}