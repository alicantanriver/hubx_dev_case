// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hubx_dev_case/features/home/data/services/home_api_service.dart';
// import 'package:hubx_dev_case/features/home/presentation/cubit/category_cubit.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CategoryCubit(HomeApiService())..loadCategories(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Categories')),
//         body: BlocBuilder<CategoryCubit, CategoryState>(
//           builder: (context, state) {
//             if (state is CategoryLoading) {
//               return const CircularProgressIndicator();
//             }
//             if (state is CategoryLoaded) {
//               return ListView.builder(
//                 itemCount: state.categories.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(state.categories[index].name),
//                   );
//                 },
//               );
//             }
//             return const Text('Failed to load');
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage() // 🟢 THIS IS REQUIRED
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text('Welcome Home')),
    );
  }
}
