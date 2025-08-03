import 'dart:convert';
import '../../../../core/network/api_client.dart';
import '../models/category_model.dart';
import '../models/question_model.dart'; // optional

class HomeApiService {
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await ApiClient.dio.get(
      'https://dummy-api-jtg6bessta-ey.a.run.app/getCategories',
    );

    final decoded =
        response.data is String ? jsonDecode(response.data) : response.data;

    final List data = decoded is Map && decoded.containsKey('data')
        ? decoded['data']
        : decoded;

    return data
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // If needed:
  Future<List<QuestionModel>> fetchQuestions() async {
    final response = await ApiClient.dio.get(
      'https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions',
    );

    final decoded =
        response.data is String ? jsonDecode(response.data) : response.data;

    final List data = decoded is Map && decoded.containsKey('data')
        ? decoded['data']
        : decoded;

    return data
        .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
