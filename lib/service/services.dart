import 'dart:async';
import 'dart:convert';
import 'package:aieone_flutter_task/model/data_model.dart';
import 'package:http/http.dart' as http;



class Services{
  Future<List<DataModel>?> getData() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((e) => new DataModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}