import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../../services/io_service.dart';
import '../../../services/local_database.dart';
import '../../../services/navigation.dart';

class InstallOrChangePassword extends StatelessWidget {
  String confirmationPassword = '';
  String oldPassword = '';
  String password = '';
  late bool correctInformation;

  @override
  Future<void> build() async {
    if(Values.password == ''){
      do{
        correctInformation = install();

        if(correctInformation){
          Values.passwordIsActiveSave('true');
          Values.passwordSave(password);

          IO.n(15);
          IO.green("${IO.t(11)}    ${"done_successfully".translate}");
          IO.green("${IO.t(11)}<<---------------------------->>");
          IO.green("${IO.t(11)}      << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.pop();
          return;
        } else {
          IO.n(15);
          IO.red("${IO.t(11)}    ${"data_not_received".translate}");
          IO.red("${IO.t(11)}<<------------------------------>>");
          IO.red("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
        }
      } while(!correctInformation);
    } else {
      do{
        correctInformation = change();

        if(correctInformation){
          Values.passwordIsActiveSave('true');
          Values.passwordSave(password);

          IO.n(15);
          IO.green("${IO.t(11)}    ${"done_successfully".translate}");
          IO.green("${IO.t(11)}<<---------------------------->>");
          IO.green("${IO.t(11)}      << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.pop();
          return;
        } else {
          IO.n(15);
          IO.red("${IO.t(11)}    ${"data_not_received".translate}");
          IO.red("${IO.t(11)}<<------------------------------>>");
          IO.red("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
        }
      } while(!correctInformation);
    }
  }

  bool install(){
    IO.n(16);
    IO.blue("${IO.t(12)}${"install_password".translate}");
    IO.magenta("\n${IO.t(11)}${"must_be_4_digits".translate}");

    IO.blueStdout("${IO.t(12)}${"password".translate}: ");
    password = IO.read;
    IO.blueStdout("${IO.t(12)}${"confirmation_password".translate}: ");
    confirmationPassword = IO.read;

    return RegExp(r'^\d{4}$').hasMatch(password) && password == confirmationPassword;
  }

  bool change(){
    IO.n(15);
    IO.blue("${IO.t(12)}${"change_password".translate}: ");
    IO.magenta("\n${IO.t(11)}${"must_be_4_digits".translate}");

    IO.blueStdout("${IO.t(12)}${"current_password".translate}: ");
    oldPassword = IO.read;
    IO.blueStdout("${IO.t(12)}${"new_password".translate}: ");
    password = IO.read;
    IO.blueStdout("${IO.t(12)}${"confirmation_new_password".translate}: ");
    confirmationPassword = IO.read;

    return oldPassword == Values.password && password == confirmationPassword;
  }
}