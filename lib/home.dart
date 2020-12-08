import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ibeacon/http.dart';
import 'package:ibeacon/manu.dart';

import 'newOpenbloco.dart';
import 'dart:io';
import 'package:get/get.dart';

import 'news.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  httpClass http = new httpClass();
  List<dynamic> result1;
  List<dynamic> data;

  getBloco() async {
    result1 = await http.httpGet("selecionaBloco.php");
    print(result1);
    setState(() {
      result1;
    });
  }

  getNoticia() async {
    data = await http.httpGet("SelecionaNoticia.php");
    print(data);
    setState(() {
      data;
    });
  }

  initState() {
    super.initState();
    getBloco();
    getNoticia();
    blue();
  }

  blue(){
    FlutterBlue data = FlutterBlue.instance;

      data.scan().listen((event) {
        print(event.device.name);
        if (event.device.name == "moto g(6) plus") {
          print("AQUI");
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, _, __) => Beacon(), opaque: false),
          );
          data.stopScan();
        }
      });
    }
  Widget  Beacon(){
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width/1.2,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: NetworkImage(result1[0]['imagem'])),
              Text("Bloco atual:${result1[0]['nome']}",style: TextStyle(fontSize: 25),),
              Divider(color: Colors.black,),
              Text("Sigla ${result1[0]['sigla']}",style: TextStyle(fontSize: 15),),
              Divider(color: Colors.black,),
              Text("Descricao ${result1[0]['descricao']}",style: TextStyle(fontSize: 15),),

            ],
          ),
        ),
      ),
    );
  }

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
          initialActiveIndex: 1 /*optional*/,
          onTap: (int i) {
            switch (i) {
              case 0:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => news()));
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
          result1 == null ? Center(child: Text("Carregando"),) : CarouselSlider(
              options: CarouselOptions(height: 300.0),

              items: result1.map((evento) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(evento['imagem'], ),fit: BoxFit.cover
                          )
                        ),
                        child:Container(
                            alignment: Alignment.bottomCenter,
                          child:Text(

                          evento['nome'],
                          style: TextStyle(fontSize: 40.0,color: Colors.white),
                        )
                        )

                    );
                  },
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                "NOTÍCiAS",
                style: TextStyle(fontSize: 20, color: Color(0xff182d76)),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            data == null
                ? Center(
                    child: Text("Carregando "),
                  )
                : Container(
                    height: 320,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, int i) {
                      return Container(
                        height: 100,
                        child: Card(
                          child: ListTile(
                            leading: Image.network("${data[i]["imagem"]}"),
                            title: Text(
                              "${data[i]["titulo"]}",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                            subtitle: Text(
                              "${data[i]['descricao']}",
                              style: TextStyle(fontSize: 11),
                            ),
                            onTap: () {
                              print("DONT TAP ME ");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        newsOpenbloco(data[i]["id_noticia"])),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
