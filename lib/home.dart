import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  List<String> userInput = [];
  List<String> newInput = [];
  TextEditingController county = TextEditingController();
  TextEditingController state = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    county.dispose();
    state.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[600],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/background1.png"),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset('assets/title3.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "VaxStat",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: county,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "County",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: state,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "State",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          //String co = county.text;
                          //String st = state.text;
                          //textCounty = county.text;
                          userInput.clear();
                          userInput.add(county.text);
                          userInput.add(state.text);
                          //text = ('$co-$st');
                          print('$userInput' + " First check");
                          Navigator.pushNamed(context, '/loading',
                              arguments: userInput);
                        },
                        icon: Icon(Icons.check),
                        label: Text('Enter')))
              ],
            ),
          )
        ],
      ),
    );
  }
}
