
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bluetooth/led.dart';

class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.tealAccent, Colors.white70])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

        Container(
            width: 200,
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$oxygen%',style: const TextStyle(fontSize: 35),),


          ],
        ),decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
            borderRadius: BorderRadius.all(Radius.circular(15)))),
        Container(
          width: 200,
            child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$oxygen',style: const TextStyle(fontSize: 35),),
            const Icon(FontAwesomeIcons.temperatureHigh),
          ],
        ) ,decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
            borderRadius: BorderRadius.all(Radius.circular(15)))),
          
          FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: (){



          },child: Icon(FontAwesomeIcons.redoAlt),)

      ],),


    );
  }
}
