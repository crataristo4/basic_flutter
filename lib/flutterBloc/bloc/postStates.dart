import 'package:flutter_network/flutterBloc/model/postsList.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class PostsInitialState extends PostState{

}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {
  final errorMessage;

  PostErrorState({this.errorMessage});
}

class PostLoaded extends PostState {
  final List<Posts> posts;

  PostLoaded({this.posts});
}
