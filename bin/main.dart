import 'package:c_group_chat_with_ai/pages/home_page.dart';
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



  // var response = await CommunicationWithApi.sendChatGPTRequest([
  //   {"role": "system", "content": "You are a helpful assistant."},
  //   {"role": "user", "content": "Who won the world series in 2020?"}
  // ]);
  // print(response);


  // Navigation.push(HomePage());


  Navigation.push(Welcome());
  Future.delayed(Duration(seconds: 3)).then((value) => Navigation.push(Register()));
}
