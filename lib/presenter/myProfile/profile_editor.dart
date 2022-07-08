import 'package:flutter/material.dart';

import 'widgets/profile_summary_informations.dart';

class ProfileEditor extends StatefulWidget {
  const ProfileEditor({Key? key}) : super(key: key);

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
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
            'Editor',
            style: TextStyle(fontSize: 30),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ProfileSummaryInformations(
              name: 'Gregory Viegas Zimmer',
              address: 'Blumenau - SC',
              photo: 'assets/images/Avatar.jpeg',
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black),
                  ),
                ),
                height: 200,
                width: double.maxFinite,
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Coloque seu login',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
