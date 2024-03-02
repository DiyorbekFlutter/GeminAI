import 'package:c_group_chat_with_ai/pages/profile/profile.dart';
import 'package:c_group_chat_with_ai/services/local_database.dart';
import 'package:c_group_chat_with_ai/services/navigation.dart';
import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../../services/io_service.dart';

class ShowEmail extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.n(15);
    IO.blue("${IO.t(11)}    ${Values.email}");
    IO.blue("${IO.t(11)}<<----------------------------->>");
    IO.blue("${IO.t(11)}       << ---  |||  --- >> ");
    IO.n(10);
    IO.read;
    Navigation.push(Profile());
  }
}
