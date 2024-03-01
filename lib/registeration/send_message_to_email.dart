import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';

import '../services/io_service.dart';

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
