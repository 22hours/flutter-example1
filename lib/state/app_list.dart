import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter_example/statless/app_cutom_tile.dart';
import 'package:flutter_example/statless/searchbar.dart';

class InstallAppList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InstallAppList();
  }
}

class _InstallAppList extends State<InstallAppList> {
  List data = [];
  List filterdData = [];
  bool loading = true;

  final searchController = TextEditingController();

  Future<List> getApps() async {
    List apps = await DeviceApps.getInstalledApplications(
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
        includeSystemApps: true);
    return apps;
  }

  void setApps() async {
    List dataList = await getApps();
    setState(() {
      this.data = dataList.toList();
      this.filterdData = dataList.toList();
      this.loading = false;
    });
  }

  void _handleChangeSearch(String value) {
    var curSearchText = value.toLowerCase();

    if (curSearchText.isEmpty) {
      setState(() {
        this.filterdData.clear();
        this.filterdData = this.data.toList();
      });
    } else {
      List<ApplicationWithIcon> _searchResult = [];

      data.forEach((elm) {
        var curAppName = elm.appName.toString().toLowerCase();
        if (curAppName.contains(curSearchText)) {
          _searchResult.add(elm);
        }
      });
      setState(() {
        this.filterdData.clear();
        this.filterdData = _searchResult.toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setApps();
  }

  @override
  Widget build(BuildContext context) {
    // var _searchBar = TextField(
    //     onChanged: (value) {
    //       this._handleChangeSearch(value);
    //     },
    //     controller: this.searchController,
    //     decoration: InputDecoration(
    //       border: OutlineInputBorder(),
    //       labelText: 'Search app',
    //     ));

    var _searchBar = SearchBar(
        searchController: searchController,
        onChange: (value) {
          _handleChangeSearch(value);
        });

    var _appListView = this.loading
        ? Container(child: Center(child: CircularProgressIndicator()))
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: this.filterdData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  key: UniqueKey(),
                  child: AppCustomTile(
                    key: UniqueKey(),
                    app: this.filterdData[index],
                  ));
              // child: Card(
              //     child: AppTile(this.filterdData[index])));
            },
          );

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(children: <Widget>[_searchBar, _appListView]),
    );
  }
}
