import 'package:Covid/models/Covid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class DetailsCovidBrazi extends StatelessWidget {
  DetailsCovidBrazi({this.state});
  Data state;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF005086),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: width,
              height: height * 0.230,
              color: Color(0xFF005086),
              child: SvgPicture.asset("images/medic.svg",
                  placeholderBuilder: (context) => Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0XFF6C63FF)),
                      )))),
          SizedBox(height: 20.0),
          Text(
            "${state.state}",
            style:
                TextStyle(fontSize: width * 0.065, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.0),
          ListTile(
            title: Text("Cases",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            leading: Icon(
              Icons.graphic_eq,
            ),
            subtitle: Text("${state.cases}"),
          ),
          ListTile(
            title: Text("Suspects",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            leading: Icon(
              Icons.local_hospital,
            ),
            subtitle: Text("${state.suspects}"),
          ),
          ListTile(
              title: Text("Deaths",
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              leading: Icon(
                Icons.new_releases,
              ),
              subtitle: Text("${state.deaths}")),
        ],
      ),
    );
  }
}
