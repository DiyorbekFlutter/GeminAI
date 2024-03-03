import 'package:c_group_chat_with_ai/pages/settings/password/install_or_change_password.dart';
import 'package:c_group_chat_with_ai/pages/settings/password/delete_password.dart';
import 'package:c_group_chat_with_ai/pages/settings/password/password_on_or_off.dart';
import 'package:c_group_chat_with_ai/services/io_service.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

class PasswordMenu extends StatelessWidget {
  @override
  Future<void> build() async {
    String input;
    bool validInput = true;

    do{
      IO.n(16);

      if(!validInput){
        IO.red("${IO.t(11)}    Mavjud bo'lmagan bo'lim!!!");
        IO.red("${IO.t(11)}<<----------------------------->>");
        IO.red("${IO.t(11)}       << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        IO.n(16);
      }

      IO.n(15);
      IO.blue("${IO.t(13)}PASSWORD\n");
      IO.green("${IO.t(12)}1. Password ${Values.passwordIsActive ? 'off' : 'on'}");
      IO.green("${IO.t(12)}2. ${Values.password == '' ? 'Install' : 'Change'} password");
      IO.green("${IO.t(12)}3. Delete password");
      IO.yellow("${IO.t(12)}4. Back");

      IO.n(6);
      IO.blue("${IO.t(10)}          YOUR CHOICE");
      IO.blue("${IO.t(10)}<<--------------------------->>");
      IO.blueStdout("${IO.t(10)}      << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3', '4'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        Navigation.push(PasswordOnOrOff());
        return;
      case '2':
        Navigation.push(InstallOrChangePassword());
        return;
      case '3':
        Navigation.push(DeletePassword());
        return;
      case '4':
        Navigation.pop();
        return;
    }

  }
}