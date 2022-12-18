import 'package:injectable/injectable.dart';

import 'app_database.dart';

@module
@dev
abstract class StorageModule {
  @lazySingleton
  @dev
  AppDatabase get database => AppDatabase();
}
