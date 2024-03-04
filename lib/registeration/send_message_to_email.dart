import 'dart:io';

import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';

import '../services/io_service.dart';
import '../services/network/api.dart';
import '../services/network/communication_with_api.dart';

Future<int?> senderMessageToEmail(String email) async {
  String username = 'quizcraft646@gmail.com';
  String password = 'mxlk saqd lsrv fqwl';
  int confirmationCode = Random().nextInt(900000) + 100000;
  final smtpServer = gmail(username, password);
  final message = Message();
  message.from = Address(username, 'ChatGPT');
  message.recipients.add(email);
  message.subject = 'Tasdiqlash kodi: $confirmationCode';
  message.text = "ChatBotga kirish uchun tasdiqlash kodi: $confirmationCode\nAgar siz buni so'ramagan bo'lsangiz, bu xabarni e'tiborsiz qoldiring.\n\nHurmat bilan,\nOpen AI Jamoasi";

  try {
    await send(message, smtpServer);
    return confirmationCode;
  } on MailerException {
    print('Nimadir xato ketdi!');
  } on SocketException {
    IO.n(15);
    IO.red("${IO.t(11)}    Internet ulanishini tekshirib ko'ring");
    IO.red("${IO.t(11)}<<----------------------------------------->>");
    IO.red("${IO.t(11)}             << ---  |||  --- >> ");
    IO.n(10);
    await Future.delayed(Duration(seconds: 2));
  }

  return null;
}

Future<bool> senderPasswordToEmail() async {
  String username = 'quizcraft646@gmail.com';
  String password = 'mxlk saqd lsrv fqwl';
  final smtpServer = gmail(username, password);
  final message = Message();
  message.from = Address(username, 'Open Ai');
  message.recipients.add(Values.email);
  message.subject = 'ChatGPT';


  List? users = await CommunicationWithApi.getAll(Api.users);
  String userOfPassword = '';

  if(users != null){
    for(var user in users){
      if(user["email"] == Values.email) userOfPassword = user["password"];
    }
  } else{
    return false;
  }

  message.text = "ChatBotga kirish parolingiz: $userOfPassword\nUshbu parolni hechkimga bermang hattoki u Open AI bo'lsa ham.\n\nHurmat bilan,\nOpen AI Jamoasi";

  try {
    await send(message, smtpServer);
    return true;
  } on MailerException {
    print('Nimadir xato ketdi!');
  } on SocketException {
    IO.n(15);
    IO.red("${IO.t(11)}    Internet ulanishini tekshirib ko'ring");
    IO.red("${IO.t(11)}<<----------------------------------------->>");
    IO.red("${IO.t(11)}             << ---  |||  --- >> ");
    IO.n(10);
    await Future.delayed(Duration(seconds: 2));
  }

  return false;
}

Future<bool> sendMessageToUser(String email, String text) async {
  String username = 'quizcraft646@gmail.com';
  String password = 'mxlk saqd lsrv fqwl';
  final smtpServer = gmail(username, password);
  final message = Message();
  message.from = Address(username, 'Open Ai');
  message.recipients.add(email);
  message.subject = 'ChatGPT';
  message.text = text;

  try {
    await send(message, smtpServer);
    return true;
  } catch(e){
    return false;
  }
}
