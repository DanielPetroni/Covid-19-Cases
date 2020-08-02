import 'package:Covid/models/theme_manager.dart';
import 'package:Covid/screens/detailsCovidWorld_screen.dart';
import 'package:Covid/screens/homepage_screen.dart';
import 'package:Covid/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager()),
    ], child: MaterialAppTheme());
  }
}

class MaterialAppTheme extends StatefulWidget {
  @override
  _MaterialAppThemeState createState() => _MaterialAppThemeState();
}

class _MaterialAppThemeState extends State<MaterialAppTheme> {
  @override
  Widget build(BuildContext context) {
    ThemeManager theme = Provider.of<ThemeManager>(context);

    return MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: theme.darkModeEnabled ? ThemeData.dark() : ThemeData.light());
  }
}
