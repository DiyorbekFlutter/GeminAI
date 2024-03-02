import 'package:c_group_chat_with_ai/services/io_service.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

class Welcome extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(1);
    IO.blue('-' * 122);
    for(int i=0; i<17; i++) {
      if(i != 9) {
        IO.blue('|${' ' * 120}|');
      } else {
        IO.blue("|${' ' * 50}\x1b[51m\x1b[32m Welcome to ChatGPT \x1b[0m\x1b[0m${' ' * 50}\x1b[34m|\x1b[0m");
      }
    }
    IO.blue('-' * 122);
  }
}
