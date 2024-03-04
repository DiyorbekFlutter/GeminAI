import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/registeration/sign_up.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../pages/loading.dart';
import '../services/io_service.dart';
import '../services/local_database.dart';
import '../services/navigation.dart';
import '../services/network/api.dart';
import '../services/network/communication_with_api.dart';

class Login extends StatelessWidget {
  String email = '';
  String password = '';
  String id = '';

  @override
  Future<void> build() async {
    String userOfPassword = '';
    bool valid = true;
    bool hasUser = false;

    do{
      IO.n(20);

      if(!valid){
        IO.red("${IO.t(8)}    Malumotlar not'g'ri kiritildi iltimos qaytadan kiriting");
        IO.red("${IO.t(8)}<<----------------------------------------------------------->>");
        IO.red("${IO.t(8)}                       << ---  |||  --- >>");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        IO.n(20);
      }

      IO.blue("${IO.t(12)}Login\n");
      IO.blueStdout('${IO.t(12)}Email: ');
      email = IO.read;

      if(email.toLowerCase() == 'go to signup'){
        Navigation.pushReplacement(SignUp());
        return;
      } else if(email.toLowerCase() == 'exit'){
        Navigation.pop();
      }

      IO.blueStdout('${IO.t(12)}Password: ');
      password = IO.read;

      if(password.toLowerCase() == 'go to signup'){
        Navigation.pushReplacement(SignUp());
        return;
      } else if(password.toLowerCase() == 'exit'){
        Navigation.pop();
      }

      if(email == 'qurbonovdiyorbek646@gmail.com' && password == 'Diyorbek646@'){
        adminLogin();
        return;
      }

      if(email.isEmpty || password.isEmpty) valid = false;
    } while(!valid);

    Navigation.push(Loading());
    List? users = await CommunicationWithApi.getAll(Api.users);

    if(users !=null){
      for (var user in users) {
        if(user["email"] == email){
          hasUser = true;
          userOfPassword = user["password"];
          id = user ["id"];
        }
      }

      if(hasUser){
        if(password == userOfPassword){
          Values.registeredSave('true');
          Values.emailSave(email);
          Values.idSave(id);

          IO.green("${IO.t(11)}    Muvoffaqiyatli bajarildi!!!");
          IO.green("${IO.t(11)}<<------------------------------>>");
          IO.green("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);

          await Future.delayed(Duration(seconds: 2));
          Navigation.pushAndRemoveUntil(HomePage());
          return;
        } else{
          IO.red("${IO.t(11)}    Noto'g'ri parol kiritildi");
          IO.red("${IO.t(11)}<<------------------------------->>");
          IO.red("${IO.t(11)}        << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.pushReplacement(Login());
          return;
        }
      } else{
        IO.red("${IO.t(11)}    Bunday nomli foydalanuvchi topilmadi");
        IO.red("${IO.t(11)}<<--------------------------------->>");
        IO.red("${IO.t(11)}         << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        Navigation.popUntil();
        return;
      }
    } else{
      IO.red("${IO.t(11)}    Kutilmagan xatolik yuz berdi");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.popUntil();
      return;
    }
  }

  void adminLogin() async {
    Values.registeredSave('true');
    Values.isAdminSave('true');
    Values.emailSave(email);
    Values.idSave(id);

    IO.n(15);
    IO.green("${IO.t(11)}      ADMIN TASDIQLANDI");
    IO.green("${IO.t(11)}<<------------------------->>");
    IO.green("${IO.t(11)}     << ---  |||  --- >> ");
    IO.n(8);

    await Future.delayed(Duration(seconds: 2));
    Navigation.pushAndRemoveUntil(HomePage());
    return;
  }
}
