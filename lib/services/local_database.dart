import 'dart:io';

class Values {
  static File passwordIsActiveFile = File('data/passwordIsActive.txt');
  static File registeredFile = File('data/registered.txt');
  static File emailFile = File('data/email.txt');

  static bool get passwordIsActive => passwordIsActiveFile.readAsStringSync() == 'true';
  static bool get registered => registeredFile.readAsStringSync() == 'true';
  static String get email => emailFile.readAsStringSync();

  static void passwordIsActiveSave(String value) => passwordIsActiveFile.writeAsString(value);
  static void registeredSave(String value) => registeredFile.writeAsString(value);
  static void emailSave(String value) => emailFile.writeAsString(value);
}
