import 'dart:convert';
import 'dart:io';
import 'package:jobswire_app/model/api_contains.dart';
import 'package:jobswire_app/model/model.dart';
import 'package:http/http.dart' as http;

class JobSwireService {
  Future<List<JobSwireModel>> datas() async {
    var respons = await http.get(Uri.parse(ApiContains().Api));

    if (respons.statusCode == HttpStatus.ok) {
      List<dynamic> decoded = json.decode(respons.body);
      return decoded.skip(1).map((e) => JobSwireModel.fromJson(e)).toList();
    } else {
      throw Exception("istek durumu başarısız oldu${respons.statusCode}");
    }
  }
}
