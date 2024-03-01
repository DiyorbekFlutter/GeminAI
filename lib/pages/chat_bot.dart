import 'package:c_group_chat_with_ai/pages/home_page.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/services/network/communication_with_api.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../services/io_service.dart';

class ChatBot extends StatelessWidget {
  @override
  Future<void> build() async {
    String input;

    IO.n(15);
    IO.blue("${IO.t(13)}Chat Bot\n");
    IO.green("${IO.t(8)}1. New chat");

    IO.n(1);
    IO.blue("${IO.t(10)}            YOUR CHOICE");
    IO.blue("${IO.t(10)}  <<--------------------------->>");
    IO.blueStdout("${IO.t(10)}        << ---  |||  ... ");
    input = IO.read;

    if(input == '1') newChat();
  }

  Future<void> newChat() async {
    IO.n(18);
    String input = '';

    while(true){
      IO.blue("\nSiz");
      IO.blueStdout("");
      input = IO.read;

      if(input.trim().toLowerCase() == 'exit'){
        Navigation.push(HomePage());
        return;
      }

      IO.blue("\nChat Bot");
      var text = await CommunicationWithApi.postToGemini(input);

      if(text != null){
        await for(var e in IO.animationPrint(text)){
          IO.greenStdout(e);
        }
      } else{
        IO.red("Kutilmagan xatolik yuz berdi");
      }
    }
  }
}

