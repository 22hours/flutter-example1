// import 'package:device_apps/device_apps.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_example/state/app_list.dart';

// class AppController extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _AppController();
// }

// class _AppController extends State<AppController> {
//   List installedAppList = [];
//   bool loading = true;

//   Future<List> getApps() async {
//     List apps = await DeviceApps.getInstalledApplications(
//         onlyAppsWithLaunchIntent: true,
//         includeAppIcons: true,
//         includeSystemApps: true);
//     return apps;
//   }

//   void setApps() async {
//     List dataList = await getApps();
//     setState(() {
//       this.installedAppList = dataList;
//       this.loading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     setApps();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (this.loading) {
//       return Container(child: Center(child: CircularProgressIndicator()));
//     } else {
//       print('${this.installedAppList.length} 개를 전달합니다');
//       return InstallAppList(installedAppList: installedAppList.map((e) => e));
//     }
//   }
// }

// class _ListWrapper extends StatelessWidget {
//   _ListWrapper({required installedAppList});
//   List<ApplicationWithIcon> installedAppList = [];

//   @override
//   Widget build(BuildContext context) {
//     print('${installedAppList.length}개 받았습니다');
//     return Container();
//   }
// }
