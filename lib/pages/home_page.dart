import 'dart:io';
import '../stateless_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Future<void> build() async {
    print("Home Page");
    stdout.write("Choose one: ");
    String choose = stdin.readLineSync()!;
  }
}
