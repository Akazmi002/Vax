import 'package:http/http.dart';
import 'dart:convert';

class Corona {
  String county;
  String state;
  //String cases;
  int vaccine;
  int population;

  Corona({this.county, this.state, this.vaccine, this.population});

  Future<void> getdata() async {
    // make the request
    Response response = await get('http://e6ab739ec20e.ngrok.io/$county');
    Map data = jsonDecode(response.body);
    print('$data' + 'corona check');

    county = data['CountyName'];
    vaccine = data['VaccinesTaken'];
    vaccine = data['VaccinesTaken'];
    population = data['Population 16+'];

    //print('$county, $vaccine, $population');
    //return data
  }
}
