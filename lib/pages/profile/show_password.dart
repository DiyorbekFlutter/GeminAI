import 'package:c_group_chat_with_ai/pages/loading.dart';
import 'package:c_group_chat_with_ai/registeration/send_message_to_email.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../services/io_service.dart';

class ShowPassword extends StatelessWidget {
  @override
  Future<void> build() async {
    Navigation.push(Loading());
    bool sent = await senderPasswordToEmail();

    if(sent){
      IO.n(15);
      IO.blue("${IO.t(11)}    ${"send_password_to_email".translate}");
      IO.blue("${IO.t(11)}<<-------------------------------->>");
      IO.blue("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      IO.read;
      Navigation.doublePop();
    } else{
      IO.red("${IO.t(11)}    ${"error".translate}");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.doublePop();
      return;
    }
  }
}
