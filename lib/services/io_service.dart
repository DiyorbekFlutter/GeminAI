import 'dart:io';

class IO{
  static void write<T>(T str) => stdout.write(str);
  static String get read => stdin.readLineSync() ?? "";
  static String t(int x) => '\t' * x;
  static void n(int x) => print('\n' * (x-1));

  static void border(Object? value) => print('\x1b[51m $value \x1b[0m');
  static void bold(Object? value) => print('\x1B[1m $value \x1B[0m');
  static void red(Object? value) => print('\x1b[31m $value\x1b[0m');
  static void green(Object? value) => print('\x1b[32m $value\x1b[0m');
  static void blue(Object? value) => print('\x1b[34m $value\x1b[0m');

  static void borderStdout(Object? value) => stdout.write('\x1b[51m $value \x1b[0m');
  static void boldStdout(Object? value) => stdout.write('\x1B[1m $value \x1B[0m');
  static void redStdout(Object? value) => stdout.write('\x1b[31m $value\x1b[0m');
  static void greenStdout(Object? value) => stdout.write('\x1b[32m $value\x1b[0m');
  static void blueStdout(Object? value) => stdout.write('\x1b[34m $value\x1b[0m');
}
