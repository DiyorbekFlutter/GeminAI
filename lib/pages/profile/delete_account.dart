import 'package:c_group_chat_with_ai/pages/loading.dart';
import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/network/communication_with_api.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../../services/io_service.dart';
import '../../services/navigation.dart';
import '../../services/network/api.dart';

class DeleteAccount extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(15);
    IO.red("${IO.t(11)}     ACCOUNTINGIZ O'CHIRILSINMI ?");
    IO.red("${IO.t(11)}<<---------------------------------->>");
    IO.red("${IO.t(11)}         << ---  |||  --- >> ");
    IO.n(6);
    IO.red("${IO.t(11)}1. O'chirilsin");
    IO.green("${IO.t(11)}2. Bekor qilish");
    IO.blueStdout("${IO.t(11)}Your choice: ");
    String input = IO.read;


    switch(input){
      case '1':
        if(caution()){
          Navigation.pushReplacement(Loading());
          await deleteAccount();
        } else {
          IO.n(15);
          IO.red("${IO.t(11)}     Bekor qilindi");
          IO.red("${IO.t(11)}<<------------------->>");
          IO.red("${IO.t(11)}  << ---  |||  --- >> ");
          IO.n(6);
          await Navigation.pop();
          return;
        }
        return;
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

  bool caution(){
    IO.n(15);
    IO.red("${IO.t(11)}O'chirilgan hisobni qayta tiklab bolmaydi !!!");
    IO.n(6);
    IO.red("${IO.t(11)}1. Baribir o'chirilsin");
    IO.green("${IO.t(11)}2. Bekor qilish");
    IO.blueStdout("${IO.t(11)}Your choice: ");
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
      IO.n(16);
      IO.green("${IO.t(11)}     Muvofaqiyatli bajarildi");
      IO.green("${IO.t(11)}<<----------------------------->>");
      IO.green("${IO.t(11)}       << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.pushAndRemoveUntil(Register());
      return;
    } else {
      IO.n(16);
      IO.red("${IO.t(11)}    Kutilmagan xatolik yuz berdi");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.pop();
      return;
    }
  }
}
