import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.iconfig.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection({Environment environment = dev}) async =>
    getIt.init(environment: environment.name);
