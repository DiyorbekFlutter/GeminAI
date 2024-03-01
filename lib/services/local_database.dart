import 'package:hive/hive.dart';

class Values {
  static Box box = Hive.box('${Variables.data}');
  static String get password => box.get("${Variables.password}") ?? "";
  static String get email => box.get("${Variables.email}") ?? "";
  static bool get passwordIsActive => box.get("${Variables.passwordIsActive}") ?? false;
  static bool get registered => box.get("${Variables.registered}") ?? false;
}



enum Variables{
  password,
  passwordIsActive,
  registered,
  email,
  data
}

