import 'package:Covid/models/Covid.dart';
import 'package:Covid/models/CovidWorld.dart';
import 'package:Covid/widgets/BuildCardBrazil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Covid/widgets/BuildCardWorld.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// ignore: must_be_immutable
class BodyScaffold extends StatelessWidget {
  BodyScaffold(this.covidWorld, this.covidBrazil);
  Covid covidBrazil;
  CovidWorld covidWorld;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ListView(
      children: <Widget>[
        Container(
            height: height * 0.180,
            width: width,
            color: Color(0xFF005086),
            child: SvgPicture.asset(
              "images/distanciamento.svg",
              placeholderBuilder: (context) => Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0XFF6C63FF)),
                  )),
            )),
        SizedBox(height: 5.0),
        Text("Cases World",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        Swiper(
          scrollDirection: Axis.horizontal,
          itemCount: covidWorld.countries.length,
          layout: SwiperLayout.CUSTOM,
          itemHeight: height * 0.230,
          itemWidth: width * 0.9,
          customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
              .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(
            [Offset(-370.0, -40.0), Offset(0.0, 0.0), Offset(370.0, -40.0)],
          ),
          itemBuilder: (context, index) {
            return BuildCardWorld(index: index, covidWorld: covidWorld);
          },
        ),
        SizedBox(height: 15.0),
        Text("Cases Brazil",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        Swiper(
          scrollDirection: Axis.horizontal,
          itemCount: covidBrazil.data.length,
          layout: SwiperLayout.CUSTOM,
          itemWidth: width * 0.9,
          itemHeight: height * 0.230,
          customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
              .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(
            [Offset(-370.0, -40.0), Offset(0.0, 0.0), Offset(370.0, -40.0)],
          ),
          itemBuilder: (context, index) {
            return BuildCardBrazil(
              index: index,
              covidBrazil: covidBrazil,
            );
          },
        ),
      ],
    );
  }
}
