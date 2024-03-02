import '../app.dart';
import '../stateless_widget.dart';

class Navigation {
  static final List<StatelessWidget> _pages = [];
  static set initialValue(StatelessWidget page) => _pages.add(page);
  static Future<void> _runPge() async => await _pages.last.build();
  static StatelessWidget _findPage(String id) => App.initialRoute[id]!;
  static Future push(StatelessWidget page) async {
    _pages.add(page);
    await _runPge();
  }
  static Future<void> pushNamed(String id) async => await push(_findPage(id));
  static Future<void> pushReplacement(StatelessWidget page) async {
    _pages.removeLast();
    _pages.add(page);
    await _runPge();
  }
  static Future<void> pushReplacementNamed(String id) async => pushReplacement(_findPage(id));
  static Future<void> pushAndRemoveUntil(StatelessWidget page) async {
    _pages.clear();
    push(page);
  }
  static Future<Object?> pop([Object? object]) async {
    _pages.removeLast();
    _runPge();
    return object;
  }
  static Future<Object?> doublePop([Object? object]) async {
    _pages.removeLast();
    _pages.removeLast();
    _runPge();
    return object;
  }
  static Future<Object?> popUntil([Object? object]) async {
    _pages.removeRange(1, _pages.length);
    await _runPge();
    return object;
  }
}
