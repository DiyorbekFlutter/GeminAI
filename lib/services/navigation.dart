import 'package:c_group_chat_with_ai/menu.dart';
import 'package:c_group_chat_with_ai/pages/home_page.dart';

import '../stateless_widget.dart';

class Navigation {
  static push(StatelessWidget page) => page.build();

  // static final List<StatelessWidget> _list =<StatelessWidget>[];
  // static set initialValue(StatelessWidget page){
  //   _list.add(page);
  // }
  // static Future _runMenu() async{
  //   await _list.last.build();
  // }
  // static StatelessWidget? _findPage(String id) {
  //   return MyApp(home: HomePage()).initialRoute[id];
  // }
  // static Future push(StatelessWidget page) async {
  //   _list.add(page);
  //   await _runMenu();
  // }
  // static Future<void>pushNamed(String id)async{
  //   StatelessWidget page =_findPage(id)!;
  //   await push(page);
  // }

}



class MyApp {
  List<StatelessWidget>initialRoute;
  StatelessWidget home;
  MyApp({
    required this.home,
    required this.initialRoute,

});




}


