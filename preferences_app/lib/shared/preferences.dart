import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;

  static bool _isDarkmode = false;
  static int _gender = 1;
  static String _name = '';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _prefs.getString('name') ?? _name;
  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get isDarkmode => _prefs.getBool('isDarkmode') ?? _isDarkmode;
  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }

  static int get gender => _prefs.getInt('gender') ?? _gender;
  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }

}