import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) {
      Modular.to.navigate('/home/');
      //Modular.to.pushReplacementNamed('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Lottie.asset('assets/imgs/loading.json'),
    ));
  }
}
