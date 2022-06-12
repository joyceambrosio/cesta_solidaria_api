import 'package:cartallum_app/src/core/routes/app_module.dart';
import 'package:cartallum_app/src/core/routes/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}