import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';

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
    print("Muvoffaqiyatli bajarildi!");
    return confirmationCode;
  } on MailerException {
    print('Nimadir xato ketdi!');
  } on SocketException {
    print('Internet ulanishini tekshirib ko\'ring');
  }

  return null;
}
