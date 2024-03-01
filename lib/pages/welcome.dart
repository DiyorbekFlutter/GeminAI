import 'package:c_group_chat_with_ai/services/io_service.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

class Welcome extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(1);
    IO.blue('-' * 116);
    for(int i=0; i<8; i++) {
      IO.blue('|${' ' * 114}|');
    }
    IO.blueStdout('|${' ' * 47}');
    IO.greenBorder(' Welcome to ChatGPT ');
    IO.blueStdout('${' ' * 47}|\n');
    for(int i=0; i<8; i++) {
      IO.blue('|${' ' * 114}|');
    }
    IO.blue('-' * 116);
  }
}