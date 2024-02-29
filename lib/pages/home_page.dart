import 'package:c_group_chat_with_ai/pages/profile.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';

import '../services/io_service.dart';
import '../stateless_widget.dart';
import 'chat_bot.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
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
      IO.blue("${IO.t(13)}Home Page\n");
      IO.green("${IO.t(13)}1. Chat bot");
      IO.green("${IO.t(13)}2. Profile");
      IO.green("${IO.t(13)}3. Settings");

      IO.n(1);
      IO.blue("${IO.t(10)}            YOUR CHOICE");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3'].contains(input);
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
    }
  }
}
