import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_test/api_model.dart';

class ApiService {
  
  Future<List<DataModel>?> getDataApi() async {
    final response =
        await http.get(Uri.parse("API HERE"));

    //Api Status Code Checking.......
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
    //Succsses Code Checking............
      if (jsonResponse is Map && jsonResponse.containsKey('products')) {
        return DataModel.fromJsonList(
            jsonResponse["products"] as List<dynamic>);
      } else {
        throw Exception('Unexpected JSON format : $jsonResponse');
      }

    } else {
      throw Exception('Failed to load items: ${response.statusCode}');

    }
  }
}
