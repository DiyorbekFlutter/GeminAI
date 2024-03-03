import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../../../services/io_service.dart';
import '../../../services/local_database.dart';
import '../../../services/navigation.dart';

class InstallOrChangePassword extends StatelessWidget {
  String confirmationPassword = '';
  String oldPassword = '';
  String password = '';
  late bool correctInformation;

  @override
  Future<void> build() async {
    if(Values.password == ''){
      do{
        correctInformation = install();

        if(correctInformation){
          Values.passwordIsActiveSave('true');
          Values.passwordSave(password);

          IO.n(15);
          IO.green("${IO.t(11)}    Muvofaqiyatli bajarildi");
          IO.green("${IO.t(11)}<<---------------------------->>");
          IO.green("${IO.t(11)}      << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.pop();
          return;
        } else {
          IO.n(15);
          IO.red("${IO.t(11)}    Malumotlar qabul qilinmadi");
          IO.red("${IO.t(11)}<<------------------------------>>");
          IO.red("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
        }
      } while(!correctInformation);
    } else {
      do{
        correctInformation = change();

        if(correctInformation){
          Values.passwordIsActiveSave('true');
          Values.passwordSave(password);

          IO.n(15);
          IO.green("${IO.t(11)}    Muvofaqiyatli bajarildi");
          IO.green("${IO.t(11)}<<---------------------------->>");
          IO.green("${IO.t(11)}      << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.pop();
          return;
        } else {
          IO.n(15);
          IO.red("${IO.t(11)}    Malumotlar qabul qilinmadi");
          IO.red("${IO.t(11)}<<------------------------------>>");
          IO.red("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
        }
      } while(!correctInformation);
    }
  }

  bool install(){
    IO.n(15);
    IO.blue("${IO.t(12)}Install password");
    IO.magenta("\n${IO.t(11)}4 ta raqam bo'lishi kerak");

    IO.blueStdout("${IO.t(12)}Password: ");
    password = IO.read;
    IO.blueStdout("${IO.t(12)}Confirmation password: ");
    confirmationPassword = IO.read;

    return RegExp(r'^\d{4}$').hasMatch(password) && password == confirmationPassword;
  }

  bool change(){
    IO.n(15);
    IO.blue("${IO.t(12)}Change password: ");
    IO.magenta("\n${IO.t(11)}4 ta raqam bo'lishi kerak");

    IO.blueStdout("${IO.t(12)}Old password: ");
    oldPassword = IO.read;
    IO.blueStdout("${IO.t(12)}New password: ");
    password = IO.read;
    IO.blueStdout("${IO.t(12)}Confirmation new password: ");
    confirmationPassword = IO.read;

    return oldPassword == Values.password && password == confirmationPassword;
  }
}