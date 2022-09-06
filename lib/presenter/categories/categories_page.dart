import 'package:app_2/core/general_providers.dart';
import 'package:app_2/core/notifiers/categories_notifier.dart';
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () async {
            await ref.read(userStateNotifierProvider.notifier).getUser();
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20),
        //     child: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) {
        //               return const FilterPage();
        //             },
        //           ),
        //         );
        //       },
        //       icon: const Icon(
        //         Icons.filter_alt_outlined,
        //         size: 28,
        //       ),
        //     ),
        //   ),
        // ],
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          title.keys.first,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
      ),
      body: BodyCategories(title: title.keys.first,),
    );
  }
}
