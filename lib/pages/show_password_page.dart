import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/pages/loading.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../services/io_service.dart';
import '../services/local_database.dart';

class ShowPasswordPage extends StatelessWidget {
  @override
  Future<void> build() async {
    String password = '';
    bool correctInformation = true;

    do{
      IO.n(18);
      IO.blue("${IO.t(12)}        ${"enter_password".translate}");
      IO.blue("${IO.t(12)}<<----------------------------->>");
      IO.blueStdout("${IO.t(12)}        << ---  |  ... ");
      password = IO.read;

      Navigation.push(Loading());
      await Future.delayed(Duration(seconds: 1));

      if(password == Values.password){
        Navigation.pushAndRemoveUntil(HomePage());
        return;
      } else {
        IO.n(18);
        IO.red("${IO.t(12)}        ${"password_is_incorrect".translate}");
        IO.red("${IO.t(12)}<<----------------------------->>");
        IO.red("${IO.t(12)}       << ---  ||| --- >>");
        IO.n(8);
        await Future.delayed(Duration(seconds: 2));
        correctInformation = false;
      }
    } while(!correctInformation);
  }
}