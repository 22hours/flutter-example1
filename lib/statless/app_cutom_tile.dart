import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/statless/app_bottom_sheet.dart';
import 'package:flutter_time_ago/flutter_time_ago.dart';

class AppCustomTile extends StatelessWidget {
  const AppCustomTile({Key? key, required this.app}) : super(key: key);

  final ApplicationWithIcon app;

  @override
  Widget build(BuildContext context) {
    var _appIcon = Image.memory(this.app.icon);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (context) => AppBottomSheet(
                icon: this.app.icon,
                appName: this.app.appName,
                packageName: this.app.packageName));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: _appIcon),
            Expanded(
                flex: 7,
                child: _AppInfoCol(
                    appName: this.app.appName,
                    packageName: this.app.packageName,
                    versionName: this.app.versionName,
                    versionCode: this.app.versionCode,
                    installTimeMillis: this.app.installTimeMillis,
                    updateTimeMillis: this.app.updateTimeMillis,
                    category: this.app.category.toString()))
          ],
        ),
      ),
    );
  }
}

class _AppInfoCol extends StatelessWidget {
  const _AppInfoCol(
      {Key? key,
      required this.appName,
      required this.packageName,
      required this.versionName,
      required this.versionCode,
      required this.installTimeMillis,
      required this.updateTimeMillis,
      required this.category})
      : super(key: key);

  final String appName;
  final String packageName;
  final String? versionName;
  final int versionCode;
  final int installTimeMillis;
  final int updateTimeMillis;
  final String category;

  @override
  Widget build(BuildContext context) {
    var updatedDate = FlutterTimeAgo.parse(this.updateTimeMillis, lang: 'en');
    var categoryText =
        this.category.split('ApplicationCategory.')[1].toString();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.appName, style: Theme.of(context).textTheme.bodyText1),
          Text(this.packageName, style: Theme.of(context).textTheme.caption),
          const Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
          Row(
            children: [
              _InfoBox(
                  icon: Icons.verified,
                  caption: 'Category',
                  value: categoryText),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
              _InfoBox(
                icon: Icons.access_time_filled,
                caption: 'Updated',
                value: updatedDate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String caption;
  final String value;
  final IconData icon;

  const _InfoBox(
      {Key? key,
      required this.caption,
      required this.value,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
              child: Icon(
                this.icon,
                // color: Theme.of(context).primaryColor,
                color: const Color.fromRGBO(150, 150, 150, 1),
                size: 10.0,
              ),
            ),
            Text('${this.caption} ',
                style: Theme.of(context).textTheme.caption),
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(
          value == 'undefined' ? "none" : value,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
        ),
      ],
    );
  }
}
