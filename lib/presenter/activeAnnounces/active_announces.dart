import 'package:flutter/material.dart';

import 'widgets/body_announces.dart';

class ActiveAnnounces extends StatelessWidget {
  const ActiveAnnounces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "Meus anúncios",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
      ),
      body: BodyAnnounces(),
    );
  }
}
