import 'package:flutter/material.dart';
import 'package:ibeacon/home.dart';
import 'package:ibeacon/login.dart';
import 'package:permission_handler/permission_handler.dart';

class entry extends StatefulWidget {
  @override
  _entryState createState() => _entryState();
}

class _entryState extends State<entry> {
  @override
  request()async{
    if (await Permission.locationAlways.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
    }
  }
  initState(){
    super.initState();
    request();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,

                      child: Image(
                        fit: BoxFit.cover,
                    image: AssetImage('assets/img.png'),
                  )),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      "assets/img1.png",

                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: OutlineButton(
                  highlightColor: Color(0xff182C76),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  color: Color(0xff182C76),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Color(0xff182C76),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(width: 30))),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Pular",
                  style: TextStyle(
                    color: Color(0xff182C76),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
