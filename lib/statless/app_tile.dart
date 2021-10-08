import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppTile extends StatelessWidget {
  AppTile(@required this._app);
  final ApplicationWithIcon _app;

  void openUrl() async {
    var url =
        'https://play.google.com/store/apps/details?id=${_app.packageName}';
    await launch(url, forceWebView: true, forceSafariVC: true);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.memory(_app.icon),
        subtitle: Text(_app.packageName),
        title: Text(_app.appName),
        onTap: () {
          openUrl();
        });
  }
}
