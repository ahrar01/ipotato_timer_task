import 'dart:async';

import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

import 'app_database.dart';

@module
@test
abstract class FakeStorageModule {
  @LazySingleton(dispose: disposeDatabase)
  @test
  AppDatabase get database => AppDatabase(NativeDatabase.memory());
}

/// dispose function signature must match Function(T instance)
FutureOr disposeDatabase(AppDatabase instance) async {
  await instance.close();
}
