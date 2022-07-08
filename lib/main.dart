import 'package:flutter/material.dart';

import 'presenter/activeAnnounces/active_announces.dart';

void main() {
  runApp(
      MaterialApp(
      title: "Anúncios",
      home: ActiveAnnounces(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
