import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class human extends StatefulWidget {
  human({Key key}) : super(key: key);

  @override
  State<human> createState() => _humanState();
}

class _humanState extends State<human> {
  var emailcontraller = TextEditingController();
  var messagecontraller = TextEditingController();

  List Doctors=['Choose your Doctor','     Doctor A     ','     Doctor C     ','     Doctor U     ','     Doctor L     ','     Doctor R     ','     Doctor P     ',];
  List DoctorName=['','Doctor A','Doctor C','Doctor U','Doctor L','Doctor R','Doctor P',];
  List DoctorEmail=['','doctor.a@gmail.com','doctor.c@gmail.com','doctor.u@gmail.com','doctor.l@gmail.com','doctor.r@gmail.com','doctor.p@gmail.com',];
  int docNum=0;

  Future<void> sendd(String tomail,String subject, message) async {
  var url='mailto:$tomail?subject=$subject&body=${Uri.encodeFull(message.toString())}';
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          enableJavaScript: true,
          forceWebView: false,
          headers: <String, String>{'hearer_key': 'hearer_value'});
    } else {
      throw "Could not launch$url";
    }
  }

  Widget build(BuildContext context) {

    return Container(decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.tealAccent, Colors.white70])),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 30.0,bottom: 30.0),
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(children: [const Text("Doctor's email:",style:  TextStyle(fontSize: 25)),Text(DoctorEmail[docNum],style: const TextStyle(fontSize: 25))]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 30.0,bottom: 30.0),
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(children: [ PopupMenuButton(
              child: Text(Doctors[docNum],style: const TextStyle(color: Colors.black,fontSize: 30)),
              color: Colors.lightBlueAccent,
              elevation: 200,
              shape: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.deepOrangeAccent,
                      width: 2
                  )
              ),
              itemBuilder:(context) => [
                PopupMenuItem(
                  child: Text(Doctors[1],style: const TextStyle(fontSize: 30)),
                  value: 1,
                  onTap: (){setState(() {
                    docNum=1;
                  });},
                ),
                PopupMenuItem(
                  child: Text(Doctors[2],style: const TextStyle(fontSize: 30)),
                  value: 2, onTap: (){setState(() {
                  docNum=2;
                });},
                ),
                PopupMenuItem(
                  child: Text(Doctors[3],style: const TextStyle(fontSize: 30)),
                  value: 3, onTap: (){setState(() {
                  docNum=3;
                });},
                ),
                PopupMenuItem(
                  child: Text(Doctors[4],style: const TextStyle(fontSize: 30)),
                  value: 4, onTap: (){setState(() {
                  docNum=4;
                });},
                ),
                PopupMenuItem(
                  child: Text(Doctors[5],style: const TextStyle(fontSize: 30)),
                  value: 5, onTap: (){setState(() {
                  docNum=5;
                });},
                ),
                PopupMenuItem(
                  child: Text(Doctors[6],style: const TextStyle(fontSize: 30)),
                  value: 6, onTap: (){setState(() {
                  docNum=6;
                });},
                ),

              ]
          )],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 30.0,bottom: 30.0),
          child: Container(
            height: 160,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: textForm(
              name: 'Type the Message here',
              controller: messagecontraller,
              texttype: TextInputType.text,
              validator:(String value) {
                if (value.isEmpty) {
                  return ('Title must not be empty');
                }
                return null;

              }
          ),
          ),
        ),
        FloatingActionButton(onPressed: (){
          setState(() {

            sendd("${DoctorEmail[docNum]}", "Hello${DoctorName[docNum]}", messagecontraller.text);
            print(messagecontraller.text);
          });

        },
        child: const Icon(FontAwesomeIcons.telegramPlane,size: 40),
        )
      ],
    ),);
  }
}
