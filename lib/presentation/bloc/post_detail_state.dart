import 'package:equatable/equatable.dart';
import '../../core/app_exception.dart';
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
  final AppException exception;

  PostDetailError(this.exception);

  @override
  List<Object?> get props => [exception];
}