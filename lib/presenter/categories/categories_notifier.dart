import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/database.dart';

final titleStateProvider = StateProvider((ref) => '');

final categoriesStateNotifierProvider =
    StateNotifierProvider<CategoriesNotifier, List<Map<String, dynamic>>>(
        (ref) {
  return CategoriesNotifier(
    ref.watch(titleStateProvider.state).state,
  );
});

class CategoriesNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  String title;

  CategoriesNotifier(this.title) : super([]) {
    getAllCategories();
  }

  void getAllCategories() async {
    state = await DatabaseApp.instance.select(
      tableName: 'Announces',
      condition: 'AnunCat = "${title}"',
    );
  }
}
