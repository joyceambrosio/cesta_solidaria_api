import 'package:cartallum_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthtModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
      ];
}
