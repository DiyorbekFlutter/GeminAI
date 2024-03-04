import '../stateless_widget.dart';

class App {
  static Map<String, StatelessWidget> initialRoute = {};
  StatelessWidget home;

  App({required this.home, required Map<String, StatelessWidget> initialRouteToApp}){
    initialRoute = initialRouteToApp;
    _runApp(home);
  }

  Future<void> _runApp(StatelessWidget page) async {
    while(true){
      await page.build();
    }
  }
}
