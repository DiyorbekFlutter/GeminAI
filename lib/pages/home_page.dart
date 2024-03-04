import 'package:c_group_chat_with_ai/pages/profile/profile.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../services/io_service.dart';
import '../stateless_widget.dart';
import 'admin.dart';
import 'chat_bot.dart';
import 'settings/settings.dart';

class HomePage extends StatelessWidget {
  static String id = "/home_page";

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
      IO.blue("${IO.t(13)}${"home_page".translate}\n");
      IO.green("${IO.t(13)}1. ${"chat_bot".translate}");
      IO.green("${IO.t(13)}2. ${"profile".translate}");
      IO.green("${IO.t(13)}3. ${"settings".translate}");
      if(Values.isAdmin) IO.green("${IO.t(13)}4. ${"admin".translate}");

      IO.n(6);
      IO.blue("${IO.t(10)}        ${"your_choice".translate}");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3', if(Values.isAdmin) '4'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        Navigation.push(ChatBot());
        return;
      case '2':
        Navigation.push(Profile());
        return;
      case '3':
        Navigation.push(Settings());
        return;
      case '4':
        Navigation.push(Admin());
        return;
    }
  }
}
