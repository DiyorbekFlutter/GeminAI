import 'package:c_group_chat_with_ai/pages/profile/delete_account.dart';
import 'package:c_group_chat_with_ai/pages/profile/logout.dart';
import 'package:c_group_chat_with_ai/pages/profile/show_email.dart';
import 'package:c_group_chat_with_ai/pages/profile/show_password.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../../services/io_service.dart';
import '../../services/navigation.dart';

class Profile extends StatelessWidget {
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
      IO.blue("${IO.t(13)}Profile\n");
      IO.green("${IO.t(13)}1. Show email");
      IO.green("${IO.t(13)}2. Show password");
      IO.red("${IO.t(13)}3. Logout");
      IO.red("${IO.t(13)}4. Delete account");

      IO.n(1);
      IO.blue("${IO.t(10)}            YOUR CHOICE");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3', '4'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        Navigation.push(ShowEmail());
        return;
      case '2':
        Navigation.push(ShowPassword());
        return;
      case '3':
        Navigation.push(Logout());
        return;
      case '4':
      Navigation.push(DeleteAccount());
        return;
    }
  }
}
