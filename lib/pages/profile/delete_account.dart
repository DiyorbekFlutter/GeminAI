import 'package:c_group_chat_with_ai/stateless_widget.dart';

import '../../services/io_service.dart';

class DeleteAccount extends StatelessWidget {
  @override
  Future<void> build() async {
    IO.blueBorder("Delate Accaunt");

    String a= IO.read;
    print('ochirmoqchimisiz?');
    print('1. Yes\n');
    print('2. No');
    switch(a){
      case '1': {
        print('deleted');
        String b= IO.read;
        IO.redBorder("haqiqatdan ham ochirmoqchimisiz? ochirilgan hisobni qayta tiklab bolmaydi!");
        print('1. Yes\n');
        print('2. No');
        switch (b){
          case '1': {
            print ('delated full');
          }
          case '2':{
            print('bekor qilindi');
          }
        }
    }
      case '2': {
        print('bekor qilindi');
      }
  }
}
}
