import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class classPage extends StatelessWidget {
  final int classId;
  Map<String,dynamic> _guide={};

  classPage({Key? key, this.classId=0}):super(key: key);
  
  void loadGuide() async{
    var guide =  await rootBundle.loadString("assets/guides/${classId}.json");
    _guide = jsonDecode(guide);
  }


  @override 
  Widget build(BuildContext context){
    loadGuide();
    return Scaffold(
      appBar: AppBar(
        title: Text("${_guide['Specialization'].toString()} ${_guide['Title'].toString()}",
        style: const TextStyle(
          fontFamily: "Lifecraft",
          fontSize: 30,
          color: Color.fromARGB(255, 72, 170, 222),
          ),
        ), 
      ),
      body: Column(children: [Card(
            color: Colors.transparent,
            elevation: 0,
            child:Column(children: [
              const Text('Best Races:'),
              Text("Horde: ${_guide["Horde_best_race"]}"),
              Text("Alliance: ${_guide["Alliance_best_race"]}"),
            ],)
        ),
        Card(),
        ]),
    );
  }
}