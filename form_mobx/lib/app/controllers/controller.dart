import 'package:form_mobx/app/models/client.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    //Seria para verificar se os campos estão nulos, irá deixar o raisedbutton desativado
    return validateName() == null &&
        validateName() == null &&
        validateCpf() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.name.length < 3) {
      return "Seu nome está incorrreto - Menor que 3 caracteres";
    }
    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!client.email.contains("@")) {
      //Nesta validação se não conter @, ele não será considerado email válido
      return "Seu email não é válido";
    }
    return null;
  }

  String validateCpf() {
    if (client.cpf == null || client.cpf.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.cpf.length < 3) {
      return "Seu email está incorrreto - Menor que 3 caracteres";
    }
    return null;
  }
}
