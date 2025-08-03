import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_dev_case/features/home/presentation/cubit/question_cubit.dart';
import '../../data/models/category_model.dart';
import '../../data/services/home_api_service.dart';
import 'package:shimmer/shimmer.dart';

class QuestionScreen extends StatelessWidget {
  final CategoryModel category;
  const QuestionScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          QuestionCubit(api: HomeApiService(), categoryId: category.id)..load(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.name),
        ),
        body: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return _buildShimmerList();
            } else if (state is QuestionLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.questions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final q = state.questions[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(q.question,
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 12),
                          ...q.options.map(
                            (opt) => Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: opt == q.answer
                                        ? Colors.green
                                        : Colors.grey.shade300),
                              ),
                              child: Text(opt),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is QuestionError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(height: 100, color: Colors.white),
          ),
        );
      },
    );
  }
}
