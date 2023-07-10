import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/username.dart';
import '../preference_service.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _usernameController = TextEditingController();
  final _preferencesService = PreferencesService();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Setting'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
          ),
          TextButton(
            onPressed: _saveSettings,
            child: Text('save Setting'),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
      username: _usernameController.text,
    );
    print(newSettings);

    _preferencesService.saveSettings(newSettings);
  }
}
