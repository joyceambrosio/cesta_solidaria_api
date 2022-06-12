import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/text_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/text_icon_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: Utils.paddingPadrao,
          decoration: const BoxDecoration(
            color: Cores.white,
            // gradient: RadialGradient(
            //   colors: [
            //     Colors.white,
            //     Colors.white10,
            //   ],
            //   radius: 1,
            // ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     Shadows.muitoLeve(),
                //   ],
                //   borderRadius: Utils.arredondamentoPadrao,
                //   color: Cores.white,
                // ),
                width: double.infinity,
                margin: Utils.marginPadrao,
                padding: Utils.paddingPadrao,
                child: Column(
                  children: [
                    Image.asset("assets/imgs/logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Email",
                      hintText: "Digite o seu email",
                      errorText: "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      validateAction: (value) {
                        return true;
                      },
                    ),
                    FormTextField(
                      labelText: "Senha",
                      hintText: "Digite sua senha",
                      errorText: "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      obscure: true,
                      validateAction: (value) {
                        return true;
                      },
                    ),
                    InkWell(
                      onTap: () {
                        print("bateu");
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: const Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            color: Cores.corPrincipal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const ButtomField(
                      labelText: "Entrar",
                      background: Cores.corPrincipal,
                      textColor: Cores.white,
                    ),
                    const ButtomField(
                      labelText: "Entrar com Google",
                      background: Cores.info,
                      icone: FaIcon(FontAwesomeIcons.google),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
