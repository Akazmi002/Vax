// import 'package:flutter/material.dart';

// class First extends StatefulWidget {
//   @override
//   _FirstState createState() => _FirstState();
// }

// class _FirstState extends State<First> {
//   List<String> userInput =[]; 
//   TextEditingController county = TextEditingController();
//   TextEditingController state = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     county.dispose();
//     state.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: Text(
//           "Home",
//         ),
//         backgroundColor: Colors.blueGrey[900],
//       ),
//       body:
//           Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//         SizedBox(height: 150),
//         Image.asset('assets/logo.png'),
//         TextField(
//           controller: county,
//           decoration: InputDecoration(
//             hintText: 'County Name',
//             labelText: 'County',
//           ),
//         ),
//         TextField(
//           controller: state,
//           decoration: InputDecoration(
//             hintText: 'State Name',
//             labelText: 'State',
//           ),
//         ),
//         SizedBox(height: 10),
//         ElevatedButton.icon(
//             onPressed: () {
//               //String co = county.text;
//               //String st = state.text;
//               //textCounty = county.text;
//               userInput.add(county.text);
//               userInput.add(state.text);
//               //text = ('$co-$st');
//               print('$userInput' + " First check");
//               Navigator.pushNamed(context, '/loading', arguments: userInput);
//             },
//             icon: Icon(Icons.check),
//             label: Text('Enter'))
//       ]),
//     );
//   }
// }
