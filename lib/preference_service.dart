import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_indraco/model/username.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', settings.username);
    print('Saved settings');
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getString('username');

    return Settings(username: username!);
  }
}
