import 'package:get_it/get_it.dart';

import 'database.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<DatabaseApp>(DatabaseApp());

  // getIt.registerSingleton<ProfileEditorController>(ProfileEditorController());
}
