import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibeacon/cadastrar.dart';
import 'package:ibeacon/home.dart';
import 'package:ibeacon/http.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  
  httpClass http = new httpClass();


  Future<int>doALogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> data = await http.httpPost("login.php",{'login':"${text.text}",'password':'${text1.text}'});

    print(data);
    prefs.setString("login", data[0]['id_usuario'],);
    prefs.setString("tipo", data[0]['tipo']);

  return 1;

  }
  
  TextEditingController text = TextEditingController();
  TextEditingController text1 = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text("Log in", style:GoogleFonts.cabinCondensed(fontSize: 40, color:Color(0xff182d76)))),
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  controller: text,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),
                    hintText: 'User ou Email',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  controller: text1,
                  obscureText: true,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),

                    hintText: 'Senha',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      color: Color(0xff182C76),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-30,

                child: OutlineButton(
                    highlightColor: Color(0xff182C76),
                    onPressed: ()  async{
                      if(text.text.isNotEmpty && text1.text.isNotEmpty){
                        if(await doALogin() == 1){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                          );
                        };
                        }else{
                        Toast.show("Preencha todos campos ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,);

                      }

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
            ],
          ),
        ) );
  }
}
