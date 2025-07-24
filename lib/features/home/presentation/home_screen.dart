import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_dev_case/features/home/data/services/home_api_service.dart';
import 'package:hubx_dev_case/features/home/presentation/cubit/category_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(HomeApiService())..loadCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              final categories = state.categories;

              return ListView.builder(
                itemCount: categories.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(category.name[0].toUpperCase()),
                      ),
                      title: Text(
                        category.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      onTap: () {
                        // Navigate to questions list, if applicable
                      },
                    ),
                  );
                },
              );
            } else if (state is CategoryError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
