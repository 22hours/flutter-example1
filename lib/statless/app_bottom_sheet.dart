import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBottomSheet extends StatelessWidget {
  final Uint8List icon;
  final String appName;
  final String packageName;

  const AppBottomSheet(
      {Key? key,
      required this.icon,
      required this.appName,
      required this.packageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _head = Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 2, child: Image.memory(this.icon)),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.appName,
                        style: Theme.of(context).textTheme.headline1),
                    Text(this.packageName,
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              )
            ]));

    var _body = Column(
      children: [
        _SheetButton(
          buttonText: 'Launch App',
          onPress: () {
            DeviceApps.openApp(this.packageName);
          },
        ),
        _SheetButton(
          buttonText: 'Open App Setting',
          onPress: () {
            DeviceApps.openAppSettings(this.packageName);
          },
        ),
        _SheetButton(
          buttonText: 'Open Playstore',
          onPress: () async {
            var url =
                'https://play.google.com/store/apps/details?id=${this.packageName}';
            await launch(url, forceWebView: true, forceSafariVC: true);
          },
        )
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_head, _body],
      ),
    );
  }
}

class _SheetButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final IconData? icon;

  const _SheetButton(
      {Key? key, required this.buttonText, required this.onPress, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        width: double.infinity,
        child: TextButton(
            onPressed: () => this.onPress(), child: Text(this.buttonText)));
  }
}

//settings_applications
//settings_applications_outlined

//DeviceApps.openApp('com.frandroid.app');
//DeviceApps.openAppSettings('com.frandroid.app');
