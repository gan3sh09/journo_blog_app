import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:journo_blog_app/data/repositories/repository.dart';
import '../../screens/general/tags/tags_imports.dart';
part 'tags_event.dart';
part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  final Repository repository;

  TagsBloc(this.repository) : super(TagsInitial()) {
    on<FetchTagsEvent>(
      (event, emit) async {
        emit(TagsLoading());
        try {
          final tagsModel = await repository.tagsRepo.getAllTags();
          emit(TagsLoaded(tagsModel.tags ?? []));
        } catch (e) {
          emit(TagsError("Failed to fetch tags: $e"));
        }
      },
    );
  }
}
