import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/registeration/sign_up.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../app.dart';
import '../pages/loading.dart';
import '../services/io_service.dart';
import '../services/navigation.dart';
import '../services/network/api.dart';
import '../services/network/communication_with_api.dart';

class Login extends StatelessWidget {
  @override
  Future<void> build() async {
    String email;
    String password;
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
      email = IO.read.trim();
      if(email.toLowerCase().trim() == 'go to signup'){
        Navigation.push(SignUp());
        return;
      }
      IO.blueStdout('${IO.t(12)}Password: ');
      password = IO.read.trim();
      if(password.toLowerCase().trim() == 'go to signup'){
        Navigation.push(SignUp());
        return;
      }

      if(email.isEmpty || password.isEmpty) valid = false;
    } while(!valid);

    // Loading chiqarish
    Navigation.push(Loading());

    // Userlar ro'yhatini mock apidan olish
    List? users = await CommunicationWithApi.getAll(Api.users);

    if(users !=null){
      for (var user in users) {
        if(user["email"] == email){
          hasUser = true;
          userOfPassword = user["password"];
        }
      }

      if(hasUser){
        if(password == userOfPassword){
          IO.green("${IO.t(11)}    Muvoffaqiyatli bajarildi!!!");
          IO.green("${IO.t(11)}<<------------------------------>>");
          IO.green("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          App().home();
          return;
        } else{
          IO.red("${IO.t(11)}    Noto'g'ri parol kiritildi");
          IO.red("${IO.t(11)}<<------------------------------->>");
          IO.red("${IO.t(11)}        << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.push(Login());
          return;
        }
      } else{
        IO.red("${IO.t(11)}    Bunday nomli foydalanuvchi topilmadi");
        IO.red("${IO.t(11)}<<--------------------------------->>");
        IO.red("${IO.t(11)}         << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        Navigation.push(Register());
        return;
      }
    } else{
      IO.red("${IO.t(11)}    Kutilmagan xatolik yuz berdi");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.push(Register());
      return;
    }
  }
}
