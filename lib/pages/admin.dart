import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';
import '../services/io_service.dart';

class Admin extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(12);
    IO.green("${IO.t(12)}Admin tasdiqlandi");
    IO.n(8);
    IO.read;
    Navigation.pop();
  }
}
