import 'package:flutter/material.dart';
import 'package:hack1/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List userInput = [];

  void setMap(List input) async {
    Corona test = Corona(county: '${input[0]}', state: '${input[1]}');
    await test.getdata();
    Map data = {
      'county': test.county,
      'state': test.state,
      'vaccine': test.vaccine,
      'population': test.population
    };
    Navigator.pushReplacementNamed(context, '/home', arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    userInput = ModalRoute.of(context).settings.arguments; //using the wrong contexxt, context doesnt get updated
    print(userInput);
    setMap(userInput);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
