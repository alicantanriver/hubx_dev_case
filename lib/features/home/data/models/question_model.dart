import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required String categoryId,
    required String question,
    required List<String> options,
    required String answer,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'].toString(),
      categoryId: json['categoryId'].toString(),
      question: (json['question'] ?? '') as String, // Safe fallback
      options: List<String>.from(json['options'] ?? []),
      answer: (json['answer'] ?? '') as String,
    );
  }
}
