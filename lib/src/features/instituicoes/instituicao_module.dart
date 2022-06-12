import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicoes_form.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicoes_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InstituicaoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => InstituicoesPage(),
            transition: TransitionType.rightToLeft),
        ChildRoute('/create',
            child: (context, args) => InstituicoesForm(),
            transition: TransitionType.rightToLeft),
      ];
}
