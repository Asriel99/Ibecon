import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibeacon/http.dart';

class newsOpenbloco extends StatefulWidget {
  @override
  String id;
  newsOpenbloco(newsid) {
    this.id = newsid;
  }
  _newsOpenblocoState createState() => _newsOpenblocoState(this.id);
}

class _newsOpenblocoState extends State<newsOpenbloco> {
  @override
  String id;

  _newsOpenblocoState(id) {
    this.id = id;
  }
  httpClass http = new httpClass();
  List<dynamic> data;
  List<dynamic> comentario;
  TextEditingController text = TextEditingController();

  getNews() async {
    data = await http.httpPost("verNoticia.php", {'id_noticia': id});
    setState(() {
      data;
    });
  }

  getComentairo() async {
    comentario =
        await http.httpPost("verComentario.php", {'id_noticia': id});
   setState(() {
     comentario;
   });
  }

  initState() {
    super.initState();
    getNews();
    getComentairo();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
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
                    child: Text("Carregando"),
                  )
                : Column(
                    children: [
                      Image.network(
                        "${data[0]["imagem"]}",
                        cacheHeight: 250,
                        cacheWidth: 250,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          "${data[0]["titulo"]}]",
                          style:
                              TextStyle(color: Color(0xff182d76), fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "${data[0]['descricao']}",
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  ),
            Divider(
              color: Colors.black,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                comentario == null
                    ? Center(
                        child: Text("Carregando"),
                      )
                    : ListView.builder(
                  shrinkWrap: true,
                        itemCount: comentario.length,
                        itemBuilder: (context, int i) {
                          return Container(
                            child: Text("ok"),
                          );
                        }),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width -100,
                        child: TextField(
                          autocorrect: true,
                          
                          controller: text,
                        ),
                      ),
                      IconButton(icon: Icon(Icons.send,color: Colors.blue,), onPressed: null)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
