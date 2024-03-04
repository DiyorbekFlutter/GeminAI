import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../../services/io_service.dart';
import '../../../services/local_database.dart';
import '../../../services/navigation.dart';

class DeletePassword extends StatelessWidget {
  @override
  Future<void> build() async {
    if(Values.password != ''){
      IO.n(15);
      IO.red("${IO.t(11)}        ${"remove_password".translate}");
      IO.red("${IO.t(11)}<<---------------------------------->>");
      IO.red("${IO.t(11)}         << ---  |||  --- >> ");
      IO.n(6);
      IO.red("${IO.t(11)}1. ${"delete_it".translate}");
      IO.green("${IO.t(11)}2. ${"cancel".translate}");
      IO.blueStdout("${IO.t(11)}${"your_choice".translate}: ");
      String input = IO.read;

      switch(input){
        case '1':
          Values.passwordSave("");
          Values.passwordIsActiveSave("false");

          IO.n(15);
          IO.green("${IO.t(11)}    ${"done_successfully".translate}");
          IO.green("${IO.t(11)}<<---------------------------->>");
          IO.green("${IO.t(11)}      << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.pop();
        default:
          IO.n(15);
          IO.red("${IO.t(11)}     ${"canceled".translate}");
          IO.red("${IO.t(11)}<<------------------->>");
          IO.red("${IO.t(11)}  << ---  |||  --- >> ");
          IO.n(6);
          await Navigation.pop();
          return;
      }
    } else {
      IO.n(15);
      IO.red("${IO.t(11)}     ${"no_password_set".translate}");
      IO.red("${IO.t(11)}<<------------------------->>");
      IO.red("${IO.t(11)}     << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.pop();
    }
  }
}