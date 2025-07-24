import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_dev_case/features/home/data/models/category_model.dart';
import '../../data/services/home_api_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeApiService api;

  CategoryCubit(this.api) : super(CategoryInitial());

  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await api.fetchCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
