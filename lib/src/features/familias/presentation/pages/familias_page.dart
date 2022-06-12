import 'dart:math';

import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/text_icon_field.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/card_familia.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mock_data/mock_data.dart';

class FamiliasPage extends StatelessWidget {
  const FamiliasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(5, (i) => 'Item $i');

    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        title: const Text('Famílias'),
      ),
      body: Container(
        padding: Utils.paddingPadrao,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            FormTextIconField(
              hintText: "Nome",
              labelText: "Nome",
              errorText: "",
              fieldType: TextInputType.text,
              isValid: true,
              validateAction: (value) {
                return true;
              },
              icon: Icons.search,
              iconAction: () {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CardFamilia(
                    idFamilia: index.toString(),
                    renda: 3000.00,
                    ultimaCesta: DateTime.now(),
                    numeroCestas: Random().nextInt(4),
                    logradouro: "",
                    bairro: "",
                    numero: "",
                    complemento: "",
                    cep: "",
                    estado: "",
                    pais: "",
                    cpfs: [
                      CPFValidator.generate(true),
                      CPFValidator.generate(true)
                    ],
                    nomes: [
                      mockName() +
                          " " +
                          mockName() +
                          " " +
                          mockName() +
                          " " +
                          mockName(),
                      mockName() +
                          " " +
                          mockName() +
                          " " +
                          mockName() +
                          " " +
                          mockName()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          onPressed: () {
            Modular.to.pushNamed('/familias/create');
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add)),
    );
  }
}
