import 'package:hive/hive.dart';

class Values {
  static Box box = Hive.box('${Variables.data}');
  static bool get registered => box.get('${Variables.registered}');
}

enum Variables {
  registered,
  data
}
