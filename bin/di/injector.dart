import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

class Injector {
  static final Injector instance = Injector._();

  Injector._();

  Future<void> configure() async {
    await _initInjectable();
  }

  T resolve<T extends Object>([String? instanceName]) =>
      GetIt.instance.get<T>(instanceName: instanceName);
}

@InjectableInit(generateForDir: ['bin'])
Future<void> _initInjectable() async => $initGetIt(GetIt.instance);
