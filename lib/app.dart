import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';

class App {
  void home(){
    while(true) {
      Navigation.push(HomePage());
    }
  }
}

runApp(App app) => app.home();