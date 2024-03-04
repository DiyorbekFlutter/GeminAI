import 'dart:async';
import 'dart:io';

import 'package:c_group_chat_with_ai/registeration/send_message_to_email.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import '../services/io_service.dart';
import '../services/network/api.dart';
import '../services/network/communication_with_api.dart';

class TeleBot {
  static late StreamSubscription<Message> messageSubscription;
  static late StreamSubscription<CallbackQuery> callbackQuerySubscription;
  static const int adminId = 2119398453;
  static String? massageText;

  static telebot() async {
    int adminId = 2119398453;
    DateTime dateTime = DateTime.now();
    String time = "${"${dateTime.day}".padLeft(2, '0')}/${"${dateTime.month}".padLeft(2, '0')}/${dateTime.year}";
    String hour = "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";

    String botTokin = '7050825894:AAETeOeOTMNMet1Auz231kYqL79W1qeL8Dw';
    final username = (await Telegram(botTokin).getMe()).username;
    var telebot = TeleDart(botTokin, Event(username!));

    var computerName = Platform.localHostname;
    var operatingSystemVersion = Platform.operatingSystemVersion;
    var qurilmaMalumoti = "Qurilma: $computerName, $operatingSystemVersion";

    telebot.start();

    telebot.sendMessage(
      adminId,
      "Hurmatli *ADMIN*, biz $time kuni soat $hour UTC da admin panelga kirishga urinishni aniqladik.\n"
      "$qurilmaMalumoti\n\n"
      "Agar bu siz bo'lmasangiz seansni yakunlashingiz mumkin.",
      parseMode: 'Markdown',
      replyMarkup: _stopOrContinue
    );

    telebot.onMessage().listen((message) async {
      switch(message.text){
        case '👥 All users':
          message.reply("⏳ *Kutilmoqda...*", parseMode: 'Markdown');
          message.reply(await _allUsers, parseMode: 'Markdown');
          _printAllUsers();
          return;
        case '💎 Number of users':
          message.reply("Ro'yhatdan o'tgan foydalanuvchilar soni: *$_numberOfUsers*", parseMode: 'Markdown');
          return;
        case '♻️ Send message to all users':
          message.reply("Yuboriladigan matnni kiting");
          messageSubscription = telebot.onMessage().listen((messageText){
            TeleBot.massageText = messageText.text;
            messageText.reply("${messageText.text}\nUshbu text hamma foydalanuvchilarga yuborilinmi?", replyMarkup: InlineKeyboardMarkup(inlineKeyboard: [
              [
                InlineKeyboardButton(text: "Tasdiqlayman", callbackData: 'send'),
                InlineKeyboardButton(text: "Bekor qilish", callbackData: 'do_not_send'),
              ]
            ]));
            messageSubscription.cancel();
            return;
          });
          return;
        case '🪓 Remove user':
          _removeUser(message, telebot);
          return;
        case '👤 Seng to user':
          await _sendMessageToUser(message, telebot);
          return;
        case 'Ilovaga qaytish ➡️':
          Navigation.pop();
          return;
      }
    });

    telebot.onCallbackQuery().listen((query) async {
      switch(query.data){
        case 'stop':
          telebot.sendMessage(adminId, 'Seans yakunlandi', replyMarkup: ReplyKeyboardMarkup(keyboard: [])).then((value) => exit(0));
          return;
        case 'continue':
          telebot.sendMessage(adminId, "*Admin panel*", parseMode: 'Markdown', replyMarkup: _mainButtons);
          return;
        case 'send':
          if(TeleBot.massageText != null){
            IO.n(15);
            _sendMessageToAllUsers(TeleBot.massageText!).listen((event) {
              telebot.sendMessage(adminId, event);
              IO.blue("${IO.t(12)}$event");
            });
          } else {
            telebot.sendMessage(adminId, "Xabar kitilmagan");
          }
          return;
        case 'do_not_send':
          telebot.sendMessage(adminId, "Bekor qilindi");
          TeleBot.massageText = null;
          return;
      }
    });
  }




  static InlineKeyboardMarkup get _stopOrContinue{
    return InlineKeyboardMarkup(
      inlineKeyboard: [
        [
          InlineKeyboardButton(text: 'Seansni tugatish', callbackData: 'stop'),
        ],
        [
          InlineKeyboardButton(text: 'Davom etish', callbackData: 'continue'),
        ],
      ]
    );
  }

  static ReplyKeyboardMarkup get _mainButtons {
    return ReplyKeyboardMarkup(
      keyboard: [
        [
          KeyboardButton(text: "👥 All users"),
          KeyboardButton(text: "💎 Number of users"),
        ],
        [
          KeyboardButton(text: "♻️ Send message to all users")
        ],
        [
          KeyboardButton(text: "🪓 Remove user"),
          KeyboardButton(text: "👤 Seng to user"),
        ],
        [
          KeyboardButton(text: "Ilovaga qaytish ➡️")
        ],
      ],
      resizeKeyboard: true,
      oneTimeKeyboard: true
    );
  }


  static Future<String> get _allUsers async {
    String allUsers = '';
    List? users = await CommunicationWithApi.getAll(Api.users);

    if(users != null){
      for (var user in users) {
        allUsers += '*Id:* ${user["id"]},\n';
        allUsers += '*Name:* ${user["name"]},\n';
        allUsers += '*Email:* ${user["email"]},\n';
        allUsers += '*Password:* ${user["password"]},\n\n';
      }
    }

    return allUsers;
  }

  static void _printAllUsers() async {
    String allUsers = '';
    List? users = await CommunicationWithApi.getAll(Api.users);

    if(users != null){
      for (var user in users) {
        allUsers += '${IO.t(10)}Id: ${user["id"]},\n';
        allUsers += '${IO.t(10)}Name: ${user["name"]},\n';
        allUsers += '${IO.t(10)}Email: ${user["email"]},\n';
        allUsers += '${IO.t(10)}Password: ${user["password"]},\n\n';
      }
    }

    await for(var e in IO.animationPrint(allUsers)){
      IO.blueStdout(e);
    }
  }

  static Future<int> get _numberOfUsers async {
    List? users = await CommunicationWithApi.getAll(Api.users);
    return users != null ? users.length : 0;
  }

  static Stream<String> _sendMessageToAllUsers(String text) async* {
    List? users = await CommunicationWithApi.getAll(Api.users);

    if(users != null){
      yield "⏳ Yuborilmoqda...";
      for (var user in users) {
        bool result = await sendMessageToUser(user["email"], text);
        yield result ? 'Yuborildi: ${user["email"]}' : 'Yuborilmadi: ${user["email"]}';
      }
      yield "Jarayon tugadi";
    }
  }

  static void _removeUser(Message message, TeleDart td) async {
    var chatId = message.chat.id;

    switch (message.text) {
      case '🪓 Remove user':
        td.sendMessage(chatId, 'Foydalanuvchi ID sini kiriting:');
        messageSubscription = td.onMessage().listen((message) async {
          if (message.text != null) {
            if(message.text != null){
              Map<String, dynamic>? result = await CommunicationWithApi.deleteElement(Api.users, message.text!.trim());
              if(result != null) {
                td.sendMessage(chatId, 'Foydalanuvchi o\'chirildi.');
              } else {
                td.sendMessage(chatId, 'Foydalanuvchi o\'chirilmadi.');
              }
            } else {
              td.sendMessage(chatId, 'Kutilmagan xatolik');
            }
          }
          messageSubscription.cancel();
        });
        return;
    }
  }

  static Future<void> _sendMessageToUser(Message message, TeleDart telebot) async {
    telebot.sendMessage(adminId, "Foydalanuvchining idsini kiting");

    messageSubscription = telebot.onMessage().listen((event) async {
      telebot.sendMessage(adminId, "⏳ Tekshiryapmiz...");
      List? users = await CommunicationWithApi.getAll(Api.users);
      String email = '';
      String userId = '';

      if(users != null){
        for (var user in users) {
          if(user["id"]  == event.text.toString().trim()){
            userId = user["id"];
            email = user["email"];
          }
        }

        if(userId != ''){
          telebot.sendMessage(adminId, "Yuboriladigan matnni kiting");
          messageSubscription = telebot.onMessage().listen((messageText){
            messageText.reply("${messageText.text}\nUshbu text hamma foydalanuvchilarga yuborilinmi?", replyMarkup: InlineKeyboardMarkup(inlineKeyboard: [
              [
                InlineKeyboardButton(text: "Tasdiqlayman", callbackData: 'send_to_user'),
                InlineKeyboardButton(text: "Bekor qilish", callbackData: 'do_not_send_to_user'),
              ]
            ]));

            callbackQuerySubscription = telebot.onCallbackQuery().listen((query) async {
              switch(query.data){
                case 'send_to_user':
                  bool result = await sendMessageToUser(email, messageText.text.toString());
                  if(result){
                    telebot.sendMessage(adminId, "Xabar yuborildi");
                  } else {
                    telebot.sendMessage(adminId, "Xabar yuborilmadi");
                  }
                  callbackQuerySubscription.cancel();
                  return;
                case 'do_not_send_to_user':
                  callbackQuerySubscription.cancel();
                  return;
              }
            });

            messageSubscription.cancel();
          });
        } else {
          telebot.sendMessage(adminId, "Bunday foydalanuvchi topilmadi");
          messageSubscription.cancel();
          return;
        }
      } else{
        telebot.sendMessage(adminId, "Tekshirishda xatolik yuz berdi");
        messageSubscription.cancel();
        return;
      }
    });
  }
}

