import 'package:Covid/screens/detailsCovidWorld_screen.dart';
import 'package:flutter/material.dart';
import 'package:Covid/models/CovidWorld.dart';

// ignore: must_be_immutable
class BuildCardWorld extends StatelessWidget {
  BuildCardWorld({this.covidWorld, @required this.index});

  CovidWorld covidWorld;
  int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: Card(
          elevation: 2.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("${covidWorld.countries[index].country}",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text("Cases: ${covidWorld.countries[index].totalConfirmed}",
                  style: TextStyle(fontSize: 18.0)),
              Text("Deaths: ${covidWorld.countries[index].totalDeaths}",
                  style: TextStyle(fontSize: 18.0)),
              InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsCovidWorld(
                            countrie: covidWorld.countries[index],
                          ))),
                  child: Text("View More >",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.red,
                      ))),
            ],
          )),
    );
  }
}
