import 'package:http/http.dart' as http;
import 'dart:convert';


class httpClass {
  String base = "https://ibeacon220.herokuapp.com/php/";

  Future<List<dynamic>> httpGet(url) async{
  http.Response response =  await http.get(base + url);
  List<dynamic> data = jsonDecode(response.body);
  return data;

  }


  Future<List<dynamic>> httpPost(url,[data]) async{
    http.Response response= await http.post(base+url, body: data);

    if(response.body != null){
      List<dynamic> result = jsonDecode(response.body);
      return result;

    }
  }





}