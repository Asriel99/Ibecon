import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibeacon/http.dart';
import 'package:toast/toast.dart';

class newsOpen extends StatefulWidget {
  @override
  String id;
  newsOpen(newsid) {
    this.id = newsid;
  }
  _newsOpenState createState() => _newsOpenState(this.id);
}

class _newsOpenState extends State<newsOpen> {
  @override
  String id;

  _newsOpenState(id) {
    this.id = id;
  }
  httpClass http = new httpClass();
  List<dynamic> data;
  List<dynamic> comentario;
  TextEditingController text = TextEditingController();

  getNews() async {
    data = await http.httpPost("verNoticiaProjeto.php", {'id_noticia': id});
    setState(() {
      data;
    });
  }

  getComentairo() async {
    comentario = await http.httpPost("verComentarioProjeto.php", {'id_noticia': id});
   setState(() {
     comentario;
   });
  }
  Future<int> doAComnet() async {
    DateTime datahr = new DateTime.now();
   var data = await http.httpPost("cadastraComentarioProjeto.php",  {
      'comentario' : text.text,
      'id_noticia' : "$id",
      'id_usuario' : '10',
     'data': '${datahr}'
    });
   print(data);
   return 1;
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
                      IconButton(icon: Icon(Icons.send,color: Colors.blue,), onPressed: () async {
                int v = await doAComnet();
                if( v== 1){
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => newsOpen(this.id)),
                );
                }else{
                Toast.show("Erro ao realizar comentario ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,);

                }
                },)
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
