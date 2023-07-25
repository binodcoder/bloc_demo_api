import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_demo_api/features/posts/repos/posts_repo.dart';
import 'package:meta/meta.dart';
import '../models/post_data_ui_model.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(PostsInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();
    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostsRepo.addPosts();
    if (success) {
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }
}
