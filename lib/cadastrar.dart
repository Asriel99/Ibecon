import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibeacon/home.dart';
import 'package:ibeacon/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';



class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  TextEditingController text = TextEditingController();
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text5 = TextEditingController();

  httpClass http = new httpClass();
  Future<int>doALogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> data = await http.httpPost("login.php",{'login':"${text.text}",'password':'${text1.text}'});

    print(data);
    prefs.setString("login", data[0]['id_usuario'],);
    prefs.setString("tipo", data[0]['tipo']);

    return 1;

  }


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
                  child: Text("Criar Conta", style:GoogleFonts.cabinCondensed(fontSize: 40, color:Color(0xff182d76)))),
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  controller: text1,

                  keyboardType: TextInputType.number,

                  decoration: new InputDecoration(

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),

                    hintText: 'CPF',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                    hintText: 'Nome',
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

                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),

                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  controller: text2,
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
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  controller: text3,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182d76), width: 2.0),
                    ),

                    hintText: 'Curso',
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width-30,

                child: OutlineButton(
                    highlightColor: Color(0xff182C76),
                    onPressed: () {
                      if(text.text.isNotEmpty && text1.text.isNotEmpty &&text2.text.isNotEmpty && text3.text.isNotEmpty ){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home()));
                      }else{
                        Toast.show("Preencha todos campos ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,);

                      }

                    },
                    color: Color(0xff182C76),
                    child: Text(
                      "Registrar",
                      style: TextStyle(
                        color: Color(0xff182C76),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        side: BorderSide(width: 30))),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("Ao clicar em registrar você concorda com os nossos Terms of Service and Privacy Policy.",style: TextStyle(color:  Color(0xff182C76)),textAlign: TextAlign.center,),
              )
            ],
          ),
        ) );
  }
}
