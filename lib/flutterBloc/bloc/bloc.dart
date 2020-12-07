import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/flutterBloc/bloc/events.dart';
import 'package:flutter_network/flutterBloc/bloc/postStates.dart';
import 'package:flutter_network/flutterBloc/exceptions/exceptions.dart';
import 'package:flutter_network/flutterBloc/model/postsList.dart';
import 'package:flutter_network/flutterBloc/repo/services.dart';
import 'package:flutter_network/ui/FakeData.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  PostRepository postRepository;
  List<Posts> posts;

  PostBloc({this.postRepository}) : super(PostsInitialState());

  @override
  Stream<PostState> mapEventToState(PostEvents events) async* {
    switch (events) {
      case PostEvents.fetchAllPosts:
        yield PostLoadingState();
        try {
          posts = await postRepository.getAllPosts();
          yield PostLoaded(posts: posts);
        } on SocketException {
          yield PostErrorState(
              errorMessage: NoInternetException("No internet"));
        } on HttpException {
          yield PostErrorState(
              errorMessage: NoServicesFoundException("No service found"));
        } on FormatException {
          yield PostErrorState(
              errorMessage: InvalidFormatException("Invalid format"));
        } catch (e) {
          yield PostErrorState(
              errorMessage: UnknownErrorException("Unknown error"));
        }

        break;
    }
  }
}
