// import 'package:hubx_dev_case/features/home/data/models/question_model.dart';
// import '../../../../core/network/api_client.dart';

// class HomeApiService {
//   Future<List<QuestionModel>> fetchQuestions() async {
//     final response = await ApiClient.dio
//         .get('https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions');
//     final List data = response.data;
//     return data.map((e) => QuestionModel.fromJson(e)).toList();
//   }
// }

import '../models/category_model.dart';
import '../../../../core/network/api_client.dart';

class HomeApiService {
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await ApiClient.dio.get(
        'https://dummy-api-jtg6bessta-ey.a.run.app/getCategories',
      );
      final List data = response.data;
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
