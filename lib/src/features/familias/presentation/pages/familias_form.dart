import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/tab_familia.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FamiliasForm extends StatefulWidget {
  FamiliasForm({Key? key}) : super(key: key);

  @override
  State<FamiliasForm> createState() => _FamiliasFormState();
}

class _FamiliasFormState extends State<FamiliasForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> tabs = <Tab>[
    Tab(icon: FaIcon(FontAwesomeIcons.moneyBill)),
    Tab(icon: FaIcon(FontAwesomeIcons.peopleGroup)),
    Tab(icon: FaIcon(FontAwesomeIcons.map)),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Cores.background,
        appBar: AppBar(
          title: const Text('Cadastro de Família'),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: tabs,
          ),
        ),
        body: Container(
          padding: Utils.paddingPadrao,
          child: TabBarView(
            controller: _tabController,
            children: [
              TabFamilia(
                onButtomClick: () {
                  _tabController.animateTo(1);
                },
              ),
              TabFamilia(
                onButtomClick: () {
                  _tabController.animateTo(2);
                },
              ),
              TabFamilia(
                onButtomClick: () {
                  _tabController.animateTo(0);
                },
              ),
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

// class FamiliasForm extends StatelessWidget {
//   const FamiliasForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Cores.background,
//         appBar: AppBar(
//           title: const Text('Cadastro de Família'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(icon: FaIcon(FontAwesomeIcons.moneyBill)),
//               Tab(icon: FaIcon(FontAwesomeIcons.peopleGroup)),
//               Tab(icon: FaIcon(FontAwesomeIcons.map)),
//             ],
//           ),
//         ),
//         body: Container(
//           padding: Utils.paddingPadrao,
//           child: TabBarView(
//             children: [
//               TabFamilia(),
//               formPessoas(),
//               formEndereco(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  // Widget formPessoas() {
  //   return Container(
  //     padding: Utils.paddingPadrao,
  //     child: const Icon(Icons.directions_transit),
  //   );
  // }

  // Widget formEndereco() {
  //   return Container(
  //     padding: Utils.paddingPadrao,
  //     child: const Icon(Icons.directions_bike),
  //   );
  // }
// }
