// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ipotato_timer_task/core/storage/app_database.dart' as _i3;
import 'package:ipotato_timer_task/core/storage/storage_module.dart' as _i7;
import 'package:ipotato_timer_task/screens/home/data/task_dao.dart' as _i4;
import 'package:ipotato_timer_task/screens/home/data/task_repository.dart'
    as _i5;
import 'package:ipotato_timer_task/screens/home/presentation/task_view_model.dart'
    as _i6;

const String _dev = 'dev';

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
    gh.lazySingleton<_i3.AppDatabase>(
      () => storageModule.database,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i4.TaskDao>(() => _i4.TaskDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i5.TaskRepository>(
        () => _i5.TaskRepository(gh<_i4.TaskDao>()));
    gh.lazySingleton<_i6.TasksViewModel>(
        () => _i6.TasksViewModel(gh<_i5.TaskRepository>()));
    return this;
  }
}

class _$StorageModule extends _i7.StorageModule {}
