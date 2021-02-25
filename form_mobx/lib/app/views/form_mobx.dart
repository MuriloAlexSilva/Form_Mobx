import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:form_mobx/app/controllers/controller.dart';

class FormMobx extends StatelessWidget {
  //Abaixo criamos um widget para ser utilizado para diversos lugares

  final controller = Controller();
  //instanciar o controller para poder ser utilizado

  _textField({String labelText, onChanged, String Function() errorText}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário MobX"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Deverá ser criado o observer similar ao setState
          Observer(
            builder: (_) {
              return _textField(
                labelText: "Digite o nome",
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            },
          ),
          Observer(
            builder: (_) {
              return _textField(
                labelText: "Digite o seu email",
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            },
          ),
          Observer(
            builder: (_) {
              return _textField(
                labelText: "Digite o seu Cpf",
                onChanged: controller.client.changeCpf,
                errorText: controller.validateCpf,
              );
            },
          ),
          Observer(
            builder: (_) {
              return RaisedButton(
                onPressed: controller.isValid ? () {} : null,
                child: Text("Salvar"),
              );
            },
          )
        ],
      ),
    );
  }
}
