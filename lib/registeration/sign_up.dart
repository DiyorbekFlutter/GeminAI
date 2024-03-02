import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/pages/loading.dart';
import 'package:c_group_chat_with_ai/registeration/login.dart';
import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/registeration/send_message_to_email.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/services/network/communication_with_api.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../services/io_service.dart';
import '../services/local_database.dart';
import '../services/network/api.dart';

class SignUp extends StatelessWidget {
  @override
  Future<void> build() async {
    String name;
    String email;
    String password;
    String confirmPassword;
    bool valid = true;
    bool hasUser = false;

    do{
      IO.n(20);

      if(!valid){
        IO.red("${IO.t(8)}    Malumotlar not'g'ri kiritildi, iltimos qaytadan kiriting!");
        IO.red("${IO.t(8)}<<----------------------------------------------------------->>");
        IO.red("${IO.t(8)}                       << ---  |||  --- >>");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        IO.n(20);
      }

      IO.blue("${IO.t(12)}Create Account\n");
      IO.blueStdout('${IO.t(12)}Name: ');
      name = IO.read;
      if(name.toLowerCase().trim() == 'go to login'){
        Navigation.push(Login());
        return;
      }
      IO.blueStdout('${IO.t(12)}Email: ');
      email = IO.read;
      if(email.toLowerCase().trim() == 'go to login'){
        Navigation.push(Login());
        return;
      }
      IO.blueStdout('${IO.t(12)}Password: ');
      password = IO.read;
      if(password.toLowerCase().trim() == 'go to login'){
        Navigation.push(Login());
        return;
      }
      IO.blueStdout('${IO.t(12)}Confirm password: ');
      confirmPassword = IO.read;
      if(confirmPassword.toLowerCase().trim() == 'go to login'){
        Navigation.push(Login());
        return;
      }

      if(name.trim().isEmpty || !validateEmail(email) || !validatePassword(password) || password != confirmPassword) valid = false;
    } while(!valid);

    // Loading chiqarish
    Navigation.push(Loading());

    // Userlar ro'yhatini mock apidan olish
    List? users = await CommunicationWithApi.getAll(Api.users);

    if(users != null){
      for (var user in users) {
        if(user["email"] == email) hasUser = true;
      }

      if(!hasUser){
        accountRegistration(email.trim(), name.trim(), password.trim());
      } else{
        IO.red("${IO.t(11)}    Avval ro'yhatdan o'tgansiz!");
        IO.red("${IO.t(11)}<<------------------------------->>");
        IO.red("${IO.t(11)}        << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        Navigation.push(Register());
      }
    } else{
      IO.red("${IO.t(11)}    Kutilmagan xatolik yuz berdi!");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.push(Register());
    }
  }


  void accountRegistration(String email, String name, String password) async {
    // Loading chiqarish
    Navigation.push(Loading());

    // Emailga SMS yuborish
    int? resultEmail = await senderMessageToEmail(email);

    IO.n(16);

    if(resultEmail != null){
      IO.blue("${IO.t(8)}    Emailingizga Tasdiqlash kodi yuborildi!");
      IO.blue("${IO.t(8)}<<------------------------------------------>>");
      IO.blueStdout("${IO.t(8)}           << ---  |||  ... ");
      String sms = IO.read;

      if(resultEmail.toString() == sms){
        // Loading chiqarish
        Navigation.push(Loading());

        // Mock apiga malumotlarni yuborish
        Map<String, dynamic>? result = await CommunicationWithApi.toPost(Api.users, {
          "name": name,
          "email": email,
          "password": password,
        });

        if(result != null){
          IO.green("${IO.t(11)}    Muvoffaqiyatli bajarildi!!!");
          IO.green("${IO.t(11)}<<------------------------------>>");
          IO.green("${IO.t(11)}       << ---  |||  --- >> ");
          IO.n(10);

          // localga saqlash
          Values.registeredSave('true');
          Values.emailSave(email);

          await Future.delayed(Duration(seconds: 2));
          Navigation.push(HomePage());
          return;
        } else{
          IO.red("${IO.t(11)}    Kutilmagan xatolik yuz berdi!");
          IO.red("${IO.t(11)}<<------------------------------->>");
          IO.red("${IO.t(11)}        << ---  |||  --- >> ");
          IO.n(10);
          await Future.delayed(Duration(seconds: 2));
          Navigation.push(Register());
        }
      } else {
        IO.green("${IO.t(11)}    Account tasdiqlanmadi!");
        IO.green("${IO.t(11)}<<------------------------->>");
        IO.green("${IO.t(11)}     << ---  |||  --- >> ");
        IO.n(10);
        await Future.delayed(Duration(seconds: 2));
        Navigation.push(Register());
      }
    } else {
      IO.red("${IO.t(11)}    Kutilmagan xatolik yuz berdi");
      IO.red("${IO.t(11)}<<------------------------------->>");
      IO.red("${IO.t(11)}        << ---  |||  --- >> ");
      IO.n(10);
      await Future.delayed(Duration(seconds: 2));
      Navigation.push(Register());
    }
  }

  bool validateEmail(String email) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  bool validatePassword(String password) {
    if (password.length < 8) return false;
    if (!password.contains(RegExp(r'\d'))) return false;
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }
}
