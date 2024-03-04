import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../../services/io_service.dart';

class PasswordOnOrOff extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(15);
    if(Values.password != ''){
      if(Values.passwordIsActive){
        Values.passwordIsActiveSave('false');

        IO.green("${IO.t(11)}    ${"done_successfully".translate}");
        IO.green("${IO.t(11)}<<---------------------------->>");
        IO.green("${IO.t(11)}      << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        Navigation.pop();
      } else {
        Values.passwordIsActiveSave('true');

        IO.green("${IO.t(11)}    ${"done_successfully".translate}");
        IO.green("${IO.t(11)}<<---------------------------->>");
        IO.green("${IO.t(11)}      << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        Navigation.pop();
      }
    } else {
      IO.red("${IO.t(11)}     ${"no_password_set".translate}");
      IO.red("${IO.t(11)}<<------------------------->>");
      IO.red("${IO.t(11)}     << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.pop();
    }
  }
}
