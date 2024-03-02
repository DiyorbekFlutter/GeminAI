import 'package:c_group_chat_with_ai/app.dart';
import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/pages/welcome.dart';
import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';

void main() async {
  Navigation.push(Welcome());
  Future.delayed(Duration(seconds: 3)).then((value) => App(
    home: Values.registered ? HomePage() : Register(),
    routes: {
      HomePage.id: HomePage(),
      Register.id: Register()
    }
  ));
}
