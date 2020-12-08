import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibeacon/home.dart';
import 'news.dart';

class privaciade extends StatefulWidget {
  @override
  _privaciadeState createState() => _privaciadeState();
}

class _privaciadeState extends State<privaciade> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [

            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 15),
                child: Text("Politicas e Privacidade", style:GoogleFonts.cabinCondensed(fontSize: 40, color:Colors.grey))),
            Divider(color: Colors.black,),

         Container(
              margin: EdgeInsets.all(10),
             child: Text(" o IBeacon preserva a privacidade dos dados dos Usuários e se compromete a não compartilhar informações pessoais com empresas, organizações e outros indivíduos, salvo: (a) se por você for autorizado, expressamente, ou através da aceitação de um documento disponibilizado pela  ; ou (b) em uma das seguintes circunstâncias: quando o Usuário chegar ao IBeaconpor meio de programas, convênios e/ou atividades oriundas de Secretarias e/ou Ministério da Educação, órgãos, agências a eles relacionados, entidades privadas, associações, fundações e/ou organizações não governamentais, que mantenham convênios ou parcerias com entes públicos, colégios, professores ou gestores: como o IBeaconpermite, a partir de testes diagnósticos, relatórios de proficiência e planos de estudos personalizados, o acompanhamento de desempenho e evolução dos Usuários (estudantes, professores etc.), em tempo real, as informações dos Usuários poderão ser compartilhadas com o respectivo ente, colégio, professor, gestor ou responsável pelo projeto. quando o Usuário chegar ao IBeaconpor meio de programas, convênios e/ou atividades oriundas de parcerias comerciais: a   poderá fornecer suas informações a parceiros, desde que seu acesso ao IBeacontenha se originado de links, banners ou sistemas integrados desse terceiro, parceiro da   e que ele, igualmente, tenha submetido a sua autorização mediante política de privacidade própria. parceiros comerciais e novos negócios: a   poderá fornecer informações gerais de uso e dos usuários do IBeaconno desenvolvimento de seus negócios, operações e parcerias comerciais, em operações societárias, processos de aquisições, joint venture, associações e fusão de empresas, submetendo, quando se fizer necessária, na forma da legislação aplicável, as partes relacionadas à obrigação de confidencialidade e de observar esta Política de Privacidade .por transferência do controle: poderemos compartilhar informações como preparação ou parte do processo de transferência de controle, operação de venda ou fusão da   ou do   Games, no entanto os dados sempre serão tratados de acordo com esta Política de Privacidade. Qualquer terceiro que adquirir o controle da  , do IBeaconou de parte do Produto terá o direito de usar as informações pessoais dos Usuários, mas sempre de acordo com esta Política de Privacidade."))




    ],
        ),


      ),
    );
  }
}
