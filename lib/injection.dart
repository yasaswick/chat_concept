import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

//Getit class instentiation
final getIt = GetIt.instance;

//Injectable configuration
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

//exposed method to register classes
void configureDependencies() => $initGetIt(getIt);
