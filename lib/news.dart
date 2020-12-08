import 'package:flutter/material.dart';
import 'package:ibeacon/home.dart';
import 'package:ibeacon/http.dart';
import 'package:ibeacon/manu.dart';
import 'package:ibeacon/newOpen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';




class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}


class _newsState extends State<news> {
  httpClass http = new httpClass();
  List<dynamic> data;
  getData() async {
    data = await http.httpGet("selecionaNoticiaProjeto.php");
    print(data);
    setState(() {
      data;
    });

  }

  @override
  void initState() {
    super.initState();
    getData();

  }


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
          initialActiveIndex: 0 /*optional*/,
          onTap: (int i)  {
            switch (i) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => news()),
                );
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menu()));
                break;

            }
          },
            ),

        body: Column(
          children: [

            Container(
              margin: EdgeInsets.fromLTRB(0, 20,0, 10),
              child: Text("NOTÍCiAS",style: TextStyle(fontSize: 20,color: Color(0xff182d76)  ),),
            ),
            Divider(
              color: Colors.black,
            ),
            data == null ?Center(child: Text("Carregando "),):  Container(
              height: MediaQuery.of(context).size.height-200,
              child: ListView.builder(

                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context , int i  ){
                  return Container(
                    height: 100,
                    child: Card(
                      child:ListTile(
                        leading: Image.network("${data[i]["imagem"]}"),
                        title: Text("${data[i]["titulo"]}",style: TextStyle(color: Colors.blue,fontSize: 12),),
                        subtitle:Text("${data[i]['descricao']}", style: TextStyle(fontSize: 11),),
                        onTap: (){
                          print("DONT TAP ME ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => newsOpen(data[i]["id_noticia"])),
                          );
                        },

                      )  ,
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
