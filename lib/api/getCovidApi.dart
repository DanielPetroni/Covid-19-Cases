import 'package:Covid/models/Covid.dart';
import 'package:Covid/models/CovidWorld.dart';
import 'package:dio/dio.dart';

var dio = Dio();
final urlAPI = 'https://covid19-brazil-api.now.sh/api/report/v1';
final urlAPIWorld = "https://api.covid19api.com/summary";
Covid covid;

Future<Covid> getCovidBr() async {

  Response response = await dio.get(urlAPI);

  if (response.statusCode == 200) {
    return Covid.fromJson(response.data);
  } else {
    throw Exception("FALHA NA CHAMADA DA API");
  }
}

Future<CovidWorld> getCovidWorld() async {
  Response responseworld = await dio.get(urlAPIWorld);
  if (responseworld.statusCode == 200) {
    return CovidWorld.fromJson(responseworld.data);
  } else {
    throw Exception("FALHA NA CHAMADA DA API");
  }
}
