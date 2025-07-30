import 'package:injectable/injectable.dart';

import 'package:get_it/get_it.dart';
import 'injactable.config.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  asExtension: true,
  usesNullSafety: true,
)
Future<void> configureDependencies() async => await getIt.init();
