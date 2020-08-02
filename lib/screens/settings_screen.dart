import 'package:Covid/models/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    ThemeManager theme = Provider.of<ThemeManager>(context);
    bool darkMode = theme.darkModeEnabled;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
          backgroundColor: Color(0xFF005086),
          elevation: 0.0),
      body: ListView(
        children: <Widget>[
          Container(
            width: width,
            height: height * 0.230,
            color: Color(0xFF005086),
            child: SvgPicture.asset(
              "images/settings.svg",
              placeholderBuilder: (context) =>
                  Center(child: CircularProgressIndicator()),
            ),
          ),
          ListTile(
              title: Text("Dark Mode"),
              trailing: Switch(
                  value: darkMode,
                  onChanged: (value) {
                    theme.setDarkMode(value);
                  }))
        ],
      ),
    );
  }
}
