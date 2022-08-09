import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bluetooth/bluetooth.dart';

class info extends StatelessWidget {
  Future<void> _launch(String url) async {
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

  // Future<void> _launch2(String url) async {
  //   if (await canLaunch(url)) {
  //   } else {
  //     await launch(url,
  //         forceSafariVC: false,
  //         enableJavaScript: true,
  //         forceWebView: false,
  //         headers: <String, String>{'hearer_key': 'hearer_value'});
  //     throw "Could not launch$url";
  //   }
  // }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.tealAccent, Colors.white70])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: TextButton(
                onPressed: () {
                  _launch(
                      "https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public");
                },
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(image: AssetImage('assets/who.png'), height: 60),
                      Text(
                        'Guide',
                        style: TextStyle(fontSize: 50),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: TextButton(
                onPressed: () {
                  _launch("https://egcovac.mohp.gov.eg/#/home");
                },
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.red,
                        size: 62,
                      ),
                      Text('Find vaccine\n centre',
                          style: TextStyle(color: Colors.black, fontSize: 30))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () {
                  _launch(
                      "https://7avpjxgdhmbbfcvqkgp0tg-on.drv.tw/corona/Main%20page%20index.html");
                },
                child:
                Center(
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.lightBlueAccent,
                        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                       // Image(image: AssetImage('assets/who.png'), height: 60),
                        Text(
                          'SCIENTIFIC HELPING',
                          style: TextStyle(fontSize: 30,color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              child: Divider(
                height: 50,
                endIndent: 75.0,
                indent: 75.0,
                thickness: 1.5,
                color: Colors.black26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "INDIE",
                    style: TextStyle(fontSize: 60),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return bluetooth(); ////s//hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
                      }));
                    },
                    child: const Text(
                      'More',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: const [
                    Text(
                      'What does it do',
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'INDIP is a secure contact tracing app that utilizes peer to peer bluetooth comunication to anonymously track the spree of covid 19 .  It notisies users of daily interaction with other users of the app , gives upates ...',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
