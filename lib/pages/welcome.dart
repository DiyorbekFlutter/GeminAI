import 'package:c_group_chat_with_ai/services/io_service.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

class Welcome extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.blue('-' * 115);
    for(int i=0; i<8; i++) {
      IO.blue('|${' ' * 113}|');
    }
    IO.blueStdout('|${' ' * 47}');
    IO.greenStdout('Welcome to ChatGPT');
    IO.blueStdout('${' ' * 46}|');
    for(int i=0; i<8; i++) {
      IO.blue('|${' ' * 113}|');
    }
    IO.blue('-' * 115);
  }
}