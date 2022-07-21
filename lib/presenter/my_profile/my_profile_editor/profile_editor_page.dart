import 'package:flutter/material.dart';

import 'widgets/body_my_profile_editor.dart';

class ProfileEditorPage extends StatefulWidget {
  const ProfileEditorPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditorPage> createState() => _ProfileEditorPageState();
}

class _ProfileEditorPageState extends State<ProfileEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Editar',
            style: TextStyle(fontSize: 30),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.save,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BodyMyProfileEditor(),
    );
  }
}
