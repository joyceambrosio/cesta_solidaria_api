import 'package:cartallum_app/src/features/familias/presentation/pages/familias_form.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familias_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FamiliaModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => FamiliasPage(),
            transition: TransitionType.rightToLeft),
        ChildRoute('/create',
            child: (context, args) => FamiliasForm(),
            transition: TransitionType.rightToLeft),
      ];
}
