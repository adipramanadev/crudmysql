import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseHelper {
  //function menampilkan data
  Future getData() async {
    String url = 'http://192.168.100.57:8000/api/get-crud';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body)["data"];
  }

  void addData(String nameproduct, String price) async {
    String url = 'http://192.168.100.57:8000/api/store-crud';
    http.post(
      Uri.parse(url),
      body: {
        "nameproduct": "$nameproduct",
        "price": "$price",
      },
    ).then((response) {
      print('response status : ${response.statusCode}');
      print('response body : ${response.body}');
    });
  }
}
