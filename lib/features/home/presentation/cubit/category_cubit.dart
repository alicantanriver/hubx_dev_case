import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/category_model.dart';
import '../../data/services/home_api_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeApiService apiService;
  CategoryCubit(this.apiService) : super(CategoryInitial());

  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await apiService.fetchCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
