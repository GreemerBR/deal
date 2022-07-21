import 'package:flutter/material.dart';

import 'widgets/new_announce_body.dart';

class NewAnnouncePage extends StatelessWidget {
  const NewAnnouncePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewAnnounceBody());
  }
}
