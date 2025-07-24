import 'dart:convert';

import '../models/category_model.dart';
import '../../../../core/network/api_client.dart';

class HomeApiService {
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await ApiClient.dio.get(
      'https://dummy-api-jtg6bessta-ey.a.run.app/getCategories',
    );

    // Decode manually if it's a string
    final decoded =
        response.data is String ? jsonDecode(response.data) : response.data;

    // Extract the list from inside the map (check the actual key used in the API)
    final List rawList = decoded['data']; // or try ['categories']

    return rawList
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
