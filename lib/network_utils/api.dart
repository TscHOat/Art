import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Network {
  final String _url = 'http://192.168.1.8:8000/api';
  final String _url_image = 'http://192.168.1.8:8000';
  var token;
  _getToken() async {
    final storage = new FlutterSecureStorage();
    token = storage.read(key: 'token');
  }

  authData(data, apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
