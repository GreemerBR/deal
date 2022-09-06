import 'package:app_2/core/models/category_model.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final titleStateProvider = StateProvider((ref) => Map<String, int>());

final categoriesStateNotifierProvider = StateNotifierProvider<CategoriesNotifier, CategoryModel>((ref) {
  return CategoriesNotifier(
    ref.watch(titleStateProvider.state).state,
  );
});

class CategoriesNotifier extends StateNotifier<CategoryModel> {
  Map<String, int> title;

  CategoriesNotifier(this.title) : super(CategoryModel(nome: 'asdf', announces: [], id: 2)) {
    getCategory();
  }

  void getCategory() async {
    var response = await Dio().get('http://zuplae.vps-kinghost.net:8082/api/categories/${title[title.keys.first]}');

    state = CategoryModel.fromMap(response.data);
  }
}
