import 'package:Covid/models/Covid.dart';
import 'package:Covid/screens/detailsCovidBrazil_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildCardBrazil extends StatelessWidget {
  BuildCardBrazil({this.covidBrazil, @required this.index});

  Covid covidBrazil;
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
              Text("${covidBrazil.data[index].state}",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text("Cases: ${covidBrazil.data[index].cases}",
                  style: TextStyle(fontSize: 18.0)),
              Text("Deaths: ${covidBrazil.data[index].deaths}",
                  style: TextStyle(fontSize: 18.0)),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsCovidBrazi(
                          state: covidBrazil.data[index],
                        ))),
                child: Text("View More >",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.red)),
              )
            ],
          )),
    );
  }
}
