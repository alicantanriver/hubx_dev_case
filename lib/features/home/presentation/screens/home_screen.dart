import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_dev_case/features/home/data/services/home_api_service.dart';
import 'package:hubx_dev_case/features/home/presentation/cubit/category_cubit.dart';
import 'package:hubx_dev_case/shared/widgets/category_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(HomeApiService())..loadCategories(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFCFC),
        appBar: AppBar(
          title: const Text('Categories'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (val) => setState(() => query = val.toLowerCase()),
                decoration: InputDecoration(
                  hintText: 'Search categories...',
                  filled: true,
                  fillColor: const Color(0xFFF1F1F1),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 🔄 Pull to refresh + grid
            Expanded(
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoryLoaded) {
                    final filtered = state.categories.where((c) {
                      return c.name.toLowerCase().contains(query);
                    }).toList();

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<CategoryCubit>().loadCategories();
                      },
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filtered.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCard(category: filtered[index]);
                        },
                      ),
                    );
                  } else if (state is CategoryError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
