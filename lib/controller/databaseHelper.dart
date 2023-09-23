import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseHelper {
  //function menampilkan data
  Future getData() async {
    String url = 'http://192.168.100.57:8000/api/get-crud';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body)["data"];
  }
}
