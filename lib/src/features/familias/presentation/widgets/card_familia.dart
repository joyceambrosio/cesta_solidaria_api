import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardFamilia extends StatelessWidget {
  String idFamilia;
  double renda;
  DateTime ultimaCesta;
  int numeroCestas;
  String logradouro;
  String bairro;
  String numero;
  String complemento;
  String cep;
  String estado;
  String pais;
  List<String> cpfs;
  List<String> nomes;

  CardFamilia({
    required this.idFamilia,
    required this.renda,
    required this.ultimaCesta,
    required this.numeroCestas,
    required this.logradouro,
    required this.bairro,
    this.numero = "",
    this.complemento = "",
    required this.cep,
    required this.estado,
    required this.pais,
    required this.cpfs,
    required this.nomes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var legendasInfo = ["Renda"];
    var dadosInfo = [renda.toString()];

    //var legendasEndereco = ["Endereço"];
    // var dadosEndereco = [
    //   logradouro + (numero.isNotEmpty ? ", " + numero : " ")
    // ];
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Shadows.muitoLeve(),
        ],
        borderRadius: Utils.arredondamentoPadrao,
        color: Cores.white,
      ),
      width: double.infinity,
      margin: Utils.marginPadrao,
      padding: Utils.paddingPadrao,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Família " + idFamilia,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Cores.corDeTextDentroContainer,
                  ),
                ),
              ),
              const Spacer(),
              if (numeroCestas > 0)
                Tooltip(
                  message: "Última cesta recebida",
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Chip(
                      label: Text(
                        DateFormat("dd/MM/yyyy").format(ultimaCesta),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              if (numeroCestas > 0)
                Tooltip(
                  message: "Cestas recebidas no ano corrente",
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Chip(
                      backgroundColor: numeroCestas <= 1
                          ? Cores.success
                          : numeroCestas == 2
                              ? Cores.warning
                              : Cores.danger,
                      avatar: const Icon(
                        Icons.inventory_2,
                        size: 15,
                      ),
                      label: Text(
                        numeroCestas.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          DescriptionList(legendas: legendasInfo, dados: dadosInfo),
          //DescriptionList(titulo: "Integrantes", legendas: nomes, dados: cpfs),
          // DescriptionList(
          //     titulo: "Endereço",
          //     legendas: legendas_endereco,
          //     dados: dados_endereco)
        ],
      ),
    );
  }
}
