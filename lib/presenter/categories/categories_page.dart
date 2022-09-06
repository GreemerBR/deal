import 'categories_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../filter/filter_page.dart';
import 'widgets/body_categories.dart';

class CategoriesPage extends HookConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleStateProvider.state).state;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FilterPage();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                size: 28,
              ),
            ),
          ),
        ],
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
      ),
      body: BodyCategories(title: title,),
    );
  }
}
