import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/home_api_service.dart';
import '../../data/models/question_model.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final HomeApiService api;
  final String categoryId;

  QuestionCubit({required this.api, required this.categoryId})
      : super(QuestionLoading());

  Future<void> load() async {
    try {
      final all = await api.fetchQuestions();
      final filtered = all.where((q) => q.categoryId == categoryId).toList();
      emit(QuestionLoaded(filtered));
    } catch (e) {
      emit(QuestionError(e.toString()));
    }
  }
}
