import 'package:c_group_chat_with_ai/pages/loading.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../../services/io_service.dart';
import '../../../stateless_widget.dart';

class LanguageMenu extends StatelessWidget {
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
      IO.blue("${IO.t(13)}${"language".translate}\n");
      IO.green("${IO.t(12)}1. UZBEK    ${Values.lang == 'uz' ? '✅' : ''}");
      IO.green("${IO.t(12)}2. ENGLISH  ${Values.lang == 'en' ? '✅' : ''}");
      IO.green("${IO.t(12)}3. РУССКИЙ  ${Values.lang == 'ru' ? '✅' : ''}");
      IO.green("${IO.t(12)}4. TÜRK  ${Values.lang == 'tr' ? '✅' : ''}");
      IO.green("${IO.t(12)}5. 한국인  ${Values.lang == 'ko' ? '✅' : ''}");
      IO.yellow("${IO.t(12)}6. ${'back'.translate}");

      IO.n(1);
      IO.blue("${IO.t(10)}         ${"your_choice".translate}");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3', '4', '5', '6'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        Values.langSave('uz');
        break;
      case '2':
        Values.langSave('en');
        break;
      case '3':
        Values.langSave('ru');
        break;
      case '4':
        Values.langSave('tr');
        break;
      case '5':
        Values.langSave('ko');
        break;
      case '6':
        Navigation.pop();
        return;
    }

    Navigation.pushReplacement(Loading());
    await Future.delayed(Duration(seconds: 1));

    IO.n(15);
    IO.green("${IO.t(11)}      ${"done_successfully".translate}");
    IO.green("${IO.t(11)}<<---------------------------->>");
    IO.green("${IO.t(11)}      << ---  |||  --- >> ");
    IO.n(10);
    await Future.delayed(Duration(seconds: 2));
    Navigation.pop();
  }
}