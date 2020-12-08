import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibeacon/home.dart';
import 'news.dart';

class termo extends StatefulWidget {
  @override
  _termoState createState() => _termoState();
}

class _termoState extends State<termo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [

            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 15),
                child: Text("Termos de uso", style:GoogleFonts.cabinCondensed(fontSize: 40, color:Colors.grey))),
            Divider(color: Colors.black,),
            Container(
              margin: EdgeInsets.all(10),
                child: Text("O IBeacon utiliza as informações coletadas, com alguns propósitos. O principal deles, é melhorar, cada vez mais, a sua experiência com o nosso Produto. Para você compreender melhor como fazemos isso, podemos usar essas informações para: facilitar a sua identificação e acesso ao Produto; fornecer a interatividade necessária ao Produto; realizar pesquisas e marketing de relacionamento com os Usuários com finalidade de divulgação de campanhas relacionadas ao Produto, demais serviços e produtos da  ; aperfeiçoamento do Produto e dos serviços prestados; auxiliar na criação ou desenvolvimento de novos produtos e serviços; exibir conteúdo personalizado e oferecer serviços, de acordo com os interesses dos Usuários, inclusive de terceiros submetidos à esta Política de Privacidade; elaborar estatísticas de um modo geral, inclusive para terceiros; prestar serviços de atendimento ao Usuário. Como dissemos antes, as informações poderão ser coletadas, armazenadas e processadas pelo IBeacon não só no Brasil, mas em qualquer lugar em que a  IBeaconou suas afiliadas, subsidiárias, parceiras ou agentes mantenham escritórios, e você consente com essa transferência de dados. Vale lembrar, que a transferência dos dados mencionada tem o objetivo de armazenamento, proteção e processamento de dados, o que pode ocorrer em razão de logística e infraestrutura relacionadas à segurança de tais informações, limitado o uso às finalidades específicas aqui elencadas e desde que o país possua legislação e regulação sobre o tratamento de dados com o mesmo nível ou nível superior de segurança que as leis brasileiras."))




          ],
        ),


      ),
    );
  }
}
