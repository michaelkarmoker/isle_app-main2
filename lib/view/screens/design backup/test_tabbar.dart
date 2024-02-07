// import 'package:flutter/material.dart';
//
//
//
// class ButtonColorChangeDemo extends StatefulWidget {
//   @override
//   _ButtonColorChangeDemoState createState() => _ButtonColorChangeDemoState();
// }
//
// class _ButtonColorChangeDemoState extends State<ButtonColorChangeDemo> {
//   Color button1Color = Colors.grey;
//   Color button2Color = Colors.grey;
//   Color button3Color = Colors.grey;
//
//   void changeColor(int buttonNumber) {
//     setState(() {
//       switch (buttonNumber) {
//         case 1:
//           button1Color = Colors.blue;
//           button2Color = Colors.grey;
//           button3Color = Colors.grey;
//           break;
//         case 2:
//           button1Color = Colors.grey;
//           button2Color = Colors.blue;
//           button3Color = Colors.grey;
//           break;
//         case 3:
//           button1Color = Colors.grey;
//           button2Color = Colors.grey;
//           button3Color = Colors.blue;
//           break;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Button Color Change Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 changeColor(1);
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(button1Color),
//               ),
//               child: Text('Button 1'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 changeColor(2);
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(button2Color),
//               ),
//               child: Text('Button 2'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 changeColor(3);
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(button3Color),
//               ),
//               child: Text('Button 3'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
