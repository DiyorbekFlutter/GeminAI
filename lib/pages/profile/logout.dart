import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../../services/io_service.dart';

class Logout extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(15);
    IO.red("${IO.t(11)}     ACCOUNTDAN CHIQMOQCHIMISIZ ?");
    IO.red("${IO.t(11)}<<---------------------------------->>");
    IO.red("${IO.t(11)}         << ---  |||  --- >> ");
    IO.n(6);
    IO.red("${IO.t(11)}1. Chiqish");
    IO.green("${IO.t(11)}2. Bekor qilish");
    IO.blueStdout("${IO.t(11)}Your choice: ");
    String input = IO.read;

    switch(input){
      case '1':
        Values.idSave("");
        Values.emailSave('');
        Values.registeredSave('false');
        Values.passwordSave('');
        Values.passwordIsActiveSave("false");
        Navigation.pushAndRemoveUntil(Register());
      default:
        IO.n(15);
        IO.red("${IO.t(11)}     Bekor qilindi");
        IO.red("${IO.t(11)}<<------------------->>");
        IO.red("${IO.t(11)}  << ---  |||  --- >> ");
        IO.n(6);
        await Navigation.pop();
        return;
    }
  }
}
