import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/services/network/communication_with_api.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import 'package:translator/translator.dart';
import '../services/io_service.dart';
import '../translate/all_languages_list.dart';

class ChatBot extends StatelessWidget {
  @override
  Future<void> build() async {
    String input;

    IO.n(15);
    IO.blue("${IO.t(13)}${IO.translate("chat_bot")}\n");
    IO.green("${IO.t(8)}1. New chat");

    IO.n(1);
    IO.blue("${IO.t(10)}          ${IO.translate("your_choice")}");
    IO.blue("${IO.t(10)}  <<--------------------------->>");
    IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
    input = IO.read;

    if(input == '1') newChat();
  }

  Future<void> newChat() async {
    IO.n(18);
    String input = '';
    String previousText = '';

    while(true){
      IO.blue("\n${IO.translate("you")}");
      IO.blueStdout(" ");
      input = IO.read;

      if(input.toLowerCase() == 'exit'){
        Navigation.pushAndRemoveUntil(HomePage());
        return;
      } else if(RegExp(r'^translate to [a-z]{2}$').hasMatch(input.toLowerCase())){
        var _ = await translateMessage(previousText, getLastTwoChars(input)) ?? input;
        await for(var e in IO.animationPrint("$_")){
          IO.yellowStdout(e);
        }
        previousText = '';
        continue;
      } else if(RegExp('from<..>').hasMatch(input)){
        String contrCode = findSubstringCountryCode(input);
        input = input.replaceAll('from<..>', '');
        var _ = await translateMessage(input, contrCode) ?? input;
        input = '$_';
      }

      IO.blue("\n${IO.translate("chat_bot")}");
      var text = await CommunicationWithApi.postToGemini(input);
      previousText = text ?? IO.translate('error');

      if(text != null){
        await for(var e in IO.animationPrint(text)){
          IO.greenStdout(e);
        }
      } else{
        IO.red(IO.translate('error'));
      }
    }
  }

  Future<Translation?> translateMessage(String text, String to) async {
    final translator = GoogleTranslator();
    if(lang.containsKey(to)){
      Translation result = await translator.translate(text, from: "auto", to: to);
      return result;
    }
    return null;
  }

  String findSubstringCountryCode(String text) {
    RegExp regex = RegExp(r'from<..>');
    Match? match = regex.firstMatch(text);
    if (match != null) return match.group(0)![5]+match.group(0)![6];
    return '';
  }

  String getLastTwoChars(String text) {
    RegExp regex = RegExp(r'.{0,2}$');
    Match? match = regex.firstMatch(text);
    if (match != null) {
      return match.group(0)!;
    } else {
      return text;
    }
  }
}

