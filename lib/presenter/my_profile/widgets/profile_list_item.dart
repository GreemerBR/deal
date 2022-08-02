// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/database.dart';
import '../../../core/get_it.dart';

// ignore: must_be_immutable
class ProfileListItem extends StatelessWidget {
  final String title;
  final Widget? destinyPage;

  DatabaseApp database = getIt.get<DatabaseApp>();

  ProfileListItem({
    Key? key,
    required this.title,
    this.destinyPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          if (destinyPage != null) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => destinyPage!),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey),
            ),
          ),
          height: 50,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 66, 191),
                    fontSize: 20,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_sharp,
                color: Colors.grey,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
