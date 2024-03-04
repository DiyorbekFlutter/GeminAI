import 'package:c_group_chat_with_ai/pages/settings/language_menu.dart';
import 'package:c_group_chat_with_ai/pages/settings/password/password_menu.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../services/io_service.dart';
import '../../services/navigation.dart';

class Settings extends StatelessWidget {
  @override
  Future<void> build() async {
    String input;
    bool validInput = true;

    do{
      IO.n(16);

      if(!validInput){
        IO.red("${IO.t(11)}    ${"not_available".translate}");
        IO.red("${IO.t(11)}<<----------------------------->>");
        IO.red("${IO.t(11)}       << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        IO.n(16);
      }

      IO.n(15);
      IO.blue("${IO.t(13)}${"settings".translate}\n");
      IO.green("${IO.t(12)}1. ${"language".translate}");
      IO.green("${IO.t(12)}2. ${"password".translate}");
      IO.yellow("${IO.t(12)}3. ${'back'.translate}");

      IO.n(6);
      IO.blue("${IO.t(10)}         ${"your_choice".translate}");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        Navigation.push(LanguageMenu());
        return;
      case '2':
        Navigation.push(PasswordMenu());
        return;
      case '3':
        Navigation.pop();
        return;
    }
  }
}
