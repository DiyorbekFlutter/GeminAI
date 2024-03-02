import 'package:c_group_chat_with_ai/pages/settings.dart';
import 'package:c_group_chat_with_ai/services/io_service.dart';
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
      IO.green("${IO.t(12)}1. Password is active");
      IO.green("${IO.t(12)}2. Update password");
      IO.green("${IO.t(12)}3. Delete");
      IO.red("${IO.t(13)}4. Back");

      IO.n(1);
      IO.blue("${IO.t(10)}            YOUR CHOICE");
      IO.blue("${IO.t(10)}  <<--------------------------->>");
      IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
      input = IO.read;

      validInput = ['1', '2', '3', '4'].contains(input);
    } while(!validInput);

    switch(input){
      case '1':
        // Navigation.push();
        return;
      case '2':
        // Navigation.push();
        return;
      case '3':
        // Navigation.push();
        return;
      case '4':
        Navigation.push(Settings());
        return;
    }

  }
}