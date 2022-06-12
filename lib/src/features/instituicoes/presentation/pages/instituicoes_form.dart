import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/tab_familia.dart';

import 'package:flutter/material.dart';

class InstituicoesForm extends StatelessWidget {
  const InstituicoesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Cores.background,
        appBar: AppBar(
          title: const Text('Cadastro de Instituição'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: Container(
          padding: Utils.paddingPadrao,
          child: TabBarView(
            children: [
              TabFamilia(onButtomClick: () => {}),
              formPessoas(),
              formEndereco(),
            ],
          ),
        ),
      ),
    );
  }

  Widget formPessoas() {
    return Container(
      padding: Utils.paddingPadrao,
      child: const Icon(Icons.directions_transit),
    );
  }

  Widget formEndereco() {
    return Container(
      padding: Utils.paddingPadrao,
      child: const Icon(Icons.directions_bike),
    );
  }
}
