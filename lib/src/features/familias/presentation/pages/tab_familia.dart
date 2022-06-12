import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom.dart';
import 'package:flutter/material.dart';

class TabFamilia extends StatefulWidget {
  VoidCallback onButtomClick;
  TabFamilia({
    required this.onButtomClick,
    Key? key,
  }) : super(key: key);

  @override
  State<TabFamilia> createState() => _TabFamiliaState();
}

class _TabFamiliaState extends State<TabFamilia> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.paddingPadrao,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: Utils.marginPadrao,
            padding: Utils.paddingPadrao,
          ),
          Center(
            child: Text(
              _counter.toString(),
            ),
          ),
          ButtomField(
            labelText: "Add",
            background: Cores.corPrincipal,
            textColor: Cores.white,
            onClick: _incrementCounter,
          ),
          ButtomField(
            labelText: "Entrar",
            background: Cores.corPrincipal,
            textColor: Cores.white,
            onClick: widget.onButtomClick,
          ),
        ],
      ),
    );
  }
}
//DefaultTabController.of(context).animateTo(1);