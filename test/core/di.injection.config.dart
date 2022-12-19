// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ipotato_timer_task/core/storage/app_database.dart' as _i3;
import 'package:ipotato_timer_task/core/storage/fake_storage_module.dart'
    as _i4;
import 'package:ipotato_timer_task/core/storage/storage_module.dart' as _i8;
import 'package:ipotato_timer_task/screens/home/data/task_dao.dart' as _i5;
import 'package:ipotato_timer_task/screens/home/data/task_repository.dart'
    as _i6;
import 'package:ipotato_timer_task/screens/home/presentation/task_view_model.dart'
    as _i7;

const String _dev = 'dev';
const String _test = 'test';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final fakeStorageModule = _$FakeStorageModule();
    gh.lazySingleton<_i3.AppDatabase>(
      () => storageModule.database,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i3.AppDatabase>(
      () => fakeStorageModule.database,
      registerFor: {_test},
      dispose: _i4.disposeDatabase,
    );
    gh.lazySingleton<_i5.TaskDao>(() => _i5.TaskDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i6.TaskRepository>(
        () => _i6.TaskRepository(gh<_i5.TaskDao>()));
    gh.lazySingleton<_i7.TasksViewModel>(
        () => _i7.TasksViewModel(gh<_i6.TaskRepository>()));
    return this;
  }
}

class _$StorageModule extends _i8.StorageModule {}

class _$FakeStorageModule extends _i4.FakeStorageModule {}
