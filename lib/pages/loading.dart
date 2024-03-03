import 'package:c_group_chat_with_ai/stateless_widget.dart';
import '../services/io_service.dart';

class Loading extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(20);
    IO.blue("${IO.t(15)}Loading...");
    IO.n(10);
  }
}
