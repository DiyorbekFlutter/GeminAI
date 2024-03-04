import 'package:c_group_chat_with_ai/pages/loading.dart';
import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/network/communication_with_api.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:c_group_chat_with_ai/translate/translate.dart';

import '../../services/io_service.dart';
import '../../services/navigation.dart';
import '../../services/network/api.dart';

class DeleteAccount extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(15);
    IO.red("${IO.t(11)}     ${"delete_your_account".translate}");
    IO.red("${IO.t(11)}<<---------------------------------->>");
    IO.red("${IO.t(11)}         << ---  |||  --- >> ");
    IO.n(6);
    IO.red("${IO.t(11)}1. ${"delete_it".translate}");
    IO.green("${IO.t(11)}2. ${"cancel".translate}");
    IO.blueStdout("${IO.t(11)}${"your_choice".translate}: ");
    String input = IO.read;


    switch(input){
      case '1':
        if(caution()){
          Navigation.pushReplacement(Loading());
          await deleteAccount();
        } else {
          IO.n(15);
          IO.red("${IO.t(11)}     ${"canceled".translate}");
          IO.red("${IO.t(11)}<<------------------->>");
          IO.red("${IO.t(11)}  << ---  |||  --- >> ");
          IO.n(6);
          await Navigation.pop();
          return;
        }
        return;
      default:
      IO.n(15);
      IO.red("${IO.t(11)}     ${"canceled".translate}");
      IO.red("${IO.t(11)}<<------------------->>");
      IO.red("${IO.t(11)}  << ---  |||  --- >> ");
      IO.n(6);
      await Navigation.pop();
      return;
    }
  }

  bool caution(){
    IO.n(15);
    IO.red("${IO.t(11)}${"to_warn".translate} !!!");
    IO.n(6);
    IO.red("${IO.t(11)}1. ${"delete_it_anyway".translate}");
    IO.green("${IO.t(11)}2. ${"cancel".translate}");
    IO.blueStdout("${IO.t(11)}${"your_choice".translate}: ");
    String input = IO.read;
    return input == '1';
  }

  Future<void> deleteAccount() async {
    Map<String, dynamic>? result = await CommunicationWithApi.deleteElement(Api.users, Values.id);

    if(result != null){
      Values.idSave("");
      Values.emailSave("");
      Values.registeredSave("false");
      Values.passwordSave("");
      Values.passwordIsActiveSave("false");
      Values.isAdminSave('false');
      Values.langSave("");

      IO.n(16);
      IO.green("${IO.t(11)}     ${"done_successfully".translate}");
      IO.green("${IO.t(11)}<<----------------------------->>");
      IO.green("${IO.t(11)}       << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.pushAndRemoveUntil(Register());
      return;
    } else {
      IO.n(16);
      IO.red("${IO.t(11)}    ${"error".translate}");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.pop();
      return;
    }
  }
}
