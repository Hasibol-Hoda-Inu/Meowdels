import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Meow! No Internet"),
      content: Text("You're currently offline! Connect your internet to see Meowdels!"),
      actions: [
        TextButton(
            onPressed: () {
              AppSettings.openAppSettings(type: AppSettingsType.wifi);
            },
            child: Text("Settings"))
      ],
    );
  }
}
