import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/charts/tipos/line_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      body: Container(
        padding: Utils.paddingPadrao,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Bem Vindo",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Cores.corTitulo),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text(
              //   "Distribuição de cestas",
              //   style: TextStyle(fontSize: 20, color: Cores.corTitulo),
              // ),
              // const SizedBox(height: 10),
              // const Divider(
              //   thickness: 2,
              //   color: Cores.corDeLinha,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: Utils.arredondamentoPadrao,
              //         color: Colors.blue,
              //       ),
              //       height: 60,
              //       width: 60,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: Utils.arredondamentoPadrao,
              //         color: Colors.blue,
              //       ),
              //       height: 60,
              //       width: 60,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: Utils.arredondamentoPadrao,
              //         color: Colors.blue,
              //       ),
              //       height: 60,
              //       width: 60,
              //     )
              //   ],
              // ),
              // const Divider(
              //   thickness: 2,
              //   color: Cores.corDeLinha,
              // ),

              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      Shadows.leve(),
                    ],
                    borderRadius: Utils.arredondamentoPadrao,
                    color: Cores.corDeCardCesta,
                  ),
                  width: double.infinity,
                  height: 150,
                  margin: Utils.marginPadrao,
                  padding: Utils.paddingPadrao,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/imgs/pessoas-caixas.png",
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Instituições",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Cores.corDeTextDentroContainer),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Modular.to.pushNamed('/instituicoes/');
                },
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: Utils.arredondamentoPadrao,
                    boxShadow: [
                      Shadows.leve(),
                    ],
                  ),
                  height: 150,
                  margin: Utils.marginPadrao,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/imgs/familia.png",
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: Utils.paddingPadrao,
                          child: const Text(
                            "Familias",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Cores.corDeTextDentroContainer),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Modular.to.pushNamed('/familias/');
                },
              ),
              Container(
                margin: Utils.marginPadrao,
                padding: Utils.paddingPadrao,
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: Utils.arredondamentoPadrao,
                  color: Colors.white,
                  boxShadow: [
                    Shadows.leve(),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Doações",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Cores.corDeTextDentroContainer),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LineChartC(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            Shadows.leve(),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            iconSize: 30,
            selectedItemColor: Cores.corPrincipal,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                label: "Dados",
                icon: Icon(Icons.person_outline),
              ),
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
