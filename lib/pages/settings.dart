import 'dart:io';

import 'package:c_group_chat_with_ai/language_menu.dart';
import 'package:c_group_chat_with_ai/services/extensions_service.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';


import '../services/io_service.dart';
import '../services/navigation.dart';

class Settings extends StatelessWidget {
  @override
  Future<void> build() async {
     //language
     //sound
     //password
            //password is active
            //update password
            //delete

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
      IO.blue("${IO.t(13)}Setting\n");
      IO.green("${IO.t(12)}1. ${"change_language".tr}");
      IO.green("${IO.t(12)}2. ${"change_password".tr}");
      IO.green("${IO.t(12)}3. ${"sound".tr}");
      IO.red("${IO.t(13)}4. ${'exit'.tr}");

      IO.n(1);
      IO.blue("${IO.t(10)}            YOUR CHOICE");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3', '4'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        Navigation.push(LanguageMenu());
        return;

      case '4':
        exit(0);
    }
  }
}
