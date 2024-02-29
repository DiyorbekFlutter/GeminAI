import 'package:c_group_chat_with_ai/registeration/sign_up.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../services/io_service.dart';
import 'login.dart';

class Register extends StatelessWidget {
  @override
  Future<void> build() async {
    bool valid = true;
    do{
      IO.n(16);

      if(!valid){
        IO.red("${IO.t(11)}    Mavjud bo'lmagan bo'lim!!!");
        IO.red("${IO.t(11)}<<----------------------------->>");
        IO.red("${IO.t(11)}        << ---  |  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        IO.n(16);
      }

      IO.blue('${IO.t(12)}Register\n');
      IO.green('${IO.t(12)}1. Login');
      IO.green('${IO.t(12)}2. Sign Up');
      IO.n(1);

      IO.blue("${IO.t(8)}              YOUR CHOICE");
      IO.blue("${IO.t(8)}   <<----------------------------->>");
      IO.blueStdout("${IO.t(8)}          << ---  |||  ... ");
      String s = IO.read;

      if(s=='1') {
        Navigation.push(Login());
        return;
      } else if(s=='2') {
        Navigation.push(SignUp());
        return;
      } else {
        valid = false;
      }
    } while(!valid);
  }
}
