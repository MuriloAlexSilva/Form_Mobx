import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;
// Sempre rodar o comando flutter pub run build_runner watch, para ser realizado as alterações no .g.dart

abstract class _ClientBase with Store {
  @observable
  String name;
  //Seria a var que será observada para ser utilizada no app
  @action
  changeName(String value) => name = value;
  //seria a ação a ser realizada

  @observable
  String cpf;
  @action
  changeCpf(String value) => cpf = value;

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;
}
