import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibeacon/entry.dart';
import 'package:ibeacon/home.dart';
import 'package:ibeacon/privacidade.dart';
import 'package:ibeacon/termosuso.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'news.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Color(0xff182d76),
          height: 40,
          items: [
            TabItem(icon: Icons.receipt_long),
            TabItem(icon: Icons.home),
            TabItem(icon: Icons.menu)
          ],
          initialActiveIndex: 2 /*optional*/,
          onTap: (int i) {
            switch (i) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => news()),
                );
                break;
              case 1:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
                break;
              case 2:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => menu()));
                break;
            }
          },
        ),
    body: Column(
      children: [

        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15),
            child: Text("Menu", style:GoogleFonts.cabinCondensed(fontSize: 40, color:Colors.grey))),
        Divider(color: Colors.black,),

        ListTile(
          title: Text("Politicas de privaciade"),
            onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => privaciade()));

            },
        ),
        ListTile(
          title: Text("Termos de uso"),
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => termo()));
          },
        ),
        ListTile(
          title: Text("Sair"),
          onTap: () async {
            SharedPreferences data= await SharedPreferences.getInstance();
            await data.clear();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => entry()));
          },
        )







      ],
    ),


      ),
    );
  }
}
