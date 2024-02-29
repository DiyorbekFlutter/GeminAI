import 'package:c_group_chat_with_ai/app.dart';
import 'package:c_group_chat_with_ai/pages/welcome.dart';
import 'package:c_group_chat_with_ai/registeration/register.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/values.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

void main() async {
  final String directory = path.join(Directory.current.path, "database");
  Hive.init(directory);
  await Hive.openBox('${Variables.data}');

  Navigation.push(Welcome());
  // Future.delayed(Duration(seconds: 2)).then((value) => runApp(App()));
  Future.delayed(Duration(seconds: 1)).then((value) => Navigation.push(Register()));
}
