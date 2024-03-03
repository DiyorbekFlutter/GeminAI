import 'en.dart';
import 'ru.dart';
import 'uz.dart';
import '../services/local_database.dart';

extension Translate on String {
  String get translate {
    switch(Values.lang){
      case '':
        return uz[this] ?? this;
      case 'uz':
        return uz[this] ?? this;
      case 'en':
        return en[this] ?? this;
      case 'ru':
        return ru[this] ?? this;
    }

    return this;
  }
}

enum Languages {uz, en, ru}


extension TextFormat on String{

  String get textBold{
    return "\x1B[1m$this\x1B[0m";
  }
  String get textItalic{
    return "\x1B[3m$this\x1B[0m";
  }
  String get textUnderline{
    return "\x1B[4m$this\x1B[0m";
  }
  String get textInvertColor{
    return "\x1B[7m$this\x1B[0m";
  }
  String get textCrossedOut{
    return "\x1B[9m$this\x1B[0m";
  }
  String get textUnderlineBold{
    return "\x1B[21m$this\x1B[0m";
  }
  String get textFrame{
    return "\x1B[51m$this\x1B[0m";
  }
}
extension BackgroundColors on String{

  String get backgroundBlack{
    return "\x1B[40m$this\x1B[0m";
  }
  String get backgroundRed{
    return "\x1B[41m$this\x1B[0m";
  }
  String get backgroundGreen{
    return "\x1B[42m$this\x1B[0m";
  }
  String get backgroundYellow{
    return "\x1B[43m$this\x1B[0m";
  }
  String get backgroundBlue{
    return "\x1B[44m$this\x1B[0m";
  }
  String get backgroundPurple{
    return "\x1B[45m$this\x1B[0m";
  }
  String get backgroundCyan{
    return "\x1B[46m$this\x1B[0m";
  }
  String get backgroundGray{
    return "\x1B[47m$this\x1B[0m";
  }

}
extension BackgroundBrightColors on String{

  String get backgroundBrightBlack{
    return "\x1B[100m$this\x1B[0m";
  }
  String get backgroundBrightRed{
    return "\x1B[101m$this\x1B[0m";
  }
  String get backgroundBrightGreen{
    return "\x1B[102m$this\x1B[0m";
  }
  String get backgroundBrightYellow{
    return "\x1B[103m$this\x1B[0m";
  }
  String get backgroundBrightBlue{
    return "\x1B[104m$this\x1B[0m";
  }
  String get backgroundBrightPurple{
    return "\x1B[105m$this\x1B[0m";
  }
  String get backgroundBrightCyan{
    return "\x1B[106m$this\x1B[0m";
  }
  String get backgroundBrightGray{
    return "\x1B[107m$this\x1B[0m";
  }

}
extension BrightColors on String{

  String get brightBlack{
    return "\x1B[90m$this\x1B[0m";
  }
  String get brightRed{
    return "\x1B[91m$this\x1B[0m";
  }
  String get brightGreen{
    return "\x1B[92m$this\x1B[0m";
  }
  String get brightYellow{
    return "\x1B[93m$this\x1B[0m";
  }
  String get brightBlue{
    return "\x1B[94m$this\x1B[0m";
  }
  String get brightPurple{
    return "\x1B[95m$this\x1B[0m";
  }
  String get brightCyan{
    return "\x1B[96m$this\x1B[0m";
  }
  String get brightGray{
    return "\x1B[97m$this\x1B[0m";
  }

}
extension Colors on String{

  String get black{
    return "\x1B[30m$this\x1B[0m";
  }
  String get red{
    return "\x1B[31m$this\x1B[0m";
  }
  String get green{
    return "\x1B[32m$this\x1B[0m";
  }
  String get yellow{
    return "\x1B[33m$this\x1B[0m";
  }
  String get blue{
    return "\x1B[34m$this\x1B[0m";
  }
  String get purple{
    return "\x1B[35m$this\x1B[0m";
  }
  String get cyan{
    return "\x1B[36m$this\x1B[0m";
  }
  String get gray{
    return "\x1B[37m$this\x1B[0m";
  }

}