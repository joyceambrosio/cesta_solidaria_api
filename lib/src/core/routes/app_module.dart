import 'package:cartallum_app/src/core/errors/not_found_page.dart';
import 'package:cartallum_app/src/core/guard/auth_guard.dart';
import 'package:cartallum_app/src/features/auth/auth_module.dart';
import 'package:cartallum_app/src/features/familias/familia_module.dart';
import 'package:cartallum_app/src/features/home/home_module.dart';
import 'package:cartallum_app/src/features/instituicoes/instituicao_module.dart';
import 'package:cartallum_app/src/features/start/presentation/pages/splash_page.dart';
import 'package:cartallum_app/src/features/start/start_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/start', module: StartModule()),
        ModuleRoute('/auth', module: AuthtModule()),
        ModuleRoute('/home', module: HomeModule(), guards: [AuthGuard()]),
        ModuleRoute('/familias',
            module: FamiliaModule(), guards: [AuthGuard()]),
        ModuleRoute('/instituicoes',
            module: InstituicaoModule(), guards: [AuthGuard()]),
        WildcardRoute(child: (context, args) => const NotFoundPage()),
      ];
}
