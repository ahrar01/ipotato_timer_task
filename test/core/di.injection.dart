import 'package:injectable/injectable.dart';
import 'package:ipotato_timer_task/core/di.iconfig.dart';

import 'di.injection.config.dart';

@injectableInit
Future<void> configureInjectionTestDependencies(
        {Environment environment = test}) async =>
    getIt.init(environment: environment.name);
