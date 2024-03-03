import 'dart:io';

class Values {
  static final File _passwordIsActiveFile = File('database/passwordIsActive.txt');
  static final File _registeredFile = File('database/registered.txt');
  static final File _passwordFile = File('database/password.txt');
  static final File _emailFile = File('database/email.txt');
  static final File _idFile = File('database/id.txt');
  static final File _langFile = File('database/lang.txt');
  static final File _isAdminFile = File('database/isAdmin.txt');

  static bool get passwordIsActive => _passwordIsActiveFile.readAsStringSync() == 'true';
  static bool get registered => _registeredFile.readAsStringSync() == 'true';
  static String get password => _passwordFile.readAsStringSync();
  static String get email => _emailFile.readAsStringSync();
  static String get id => _idFile.readAsStringSync();
  static String get lang => _langFile.readAsStringSync();
  static bool get isAdmin => _isAdminFile.readAsStringSync() == 'true';

  static void passwordIsActiveSave(String value) => _passwordIsActiveFile.writeAsString(value);
  static void registeredSave(String value) => _registeredFile.writeAsString(value);
  static void passwordSave(String value) => _passwordFile.writeAsString(value);
  static void emailSave(String value) => _emailFile.writeAsString(value);
  static void idSave(String value) => _idFile.writeAsString(value);
  static void langSave(String value) => _langFile.writeAsString(value);
  static void isAdminSave(String value) => _isAdminFile.writeAsString(value);
}
