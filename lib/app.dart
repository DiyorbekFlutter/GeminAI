import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

class App {
  static Map<String, StatelessWidget> initialRoute = {};

  App({required StatelessWidget home, required Map<String, StatelessWidget> routes}){
    initialRoute = routes;
    Navigation.pushReplacement(home);
  }
}
