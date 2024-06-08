import 'dart:convert';


import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

class BaseAPINetwork{

  Future GetAPIwithHeader(String baseURL , var headers)async{
    final request = await http.get(Uri.parse(baseURL) , headers: headers);
    var data = await jsonDecode(request.body);

    return data;

  }

  Future GetAPIwithoutHeader(String baseURL)async{
    final request = await http.get(Uri.parse(baseURL));
    var data = await jsonDecode(request.body);

    return data;

  }

  Future PostAPIwithHeader(String baseURL , var body,var headers)async{
    final request = await http.post(
        Uri.parse(baseURL) ,
        body: jsonEncode(body),
        headers: headers
    );
    var data = await jsonDecode(request.body);
    print(data);

    return data;

  }


}