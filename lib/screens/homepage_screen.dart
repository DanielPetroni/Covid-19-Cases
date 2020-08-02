import 'package:Covid/api/getCovidApi.dart';
import 'package:Covid/models/Covid.dart';
import 'package:Covid/models/CovidWorld.dart';
import 'package:Covid/screens/settings_screen.dart';

import 'package:flutter/material.dart';
import 'package:Covid/widgets/bodyScaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([getCovidBr(), getCovidWorld()]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          Covid covidBrazil = snapshot.data[0];
          CovidWorld covidworld = snapshot.data[1];
          return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Color(0xFF005086),
                title: Text("COVID-19 CASES"),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Settings())))
                ],
              ),
              body: BodyScaffold(covidworld, covidBrazil));
        } else {
          return Scaffold(
              body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("COVID-19 CASES",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
              Image.asset("images/Logo.png",
                  height: 200.0, width: 200.0, fit: BoxFit.contain)
            ],
          ));
        }
      },
    );
  }
}
