import 'dart:io';

import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl = 'https://randomuser.me/api/?results=50';
  String endPoint = 'http://192.168.4.142:3000';

  Future<http.Response> getUsers() async {
    return await http.get(apiUrl);
  }

  Future<http.Response> doLogin(String username, String password) async {
    return await http.post('$endPoint/patient-login',
        body: {'username': username, 'password': password});
  }

  Future<http.Response> getLabOrders(String token) async {
    return await http.get(
      '$endPoint/labs/order',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
  }

  Future<http.Response> getLabResults(String token, String orderId) async {
    return await http.get(
      '$endPoint/labs/result?orderId=$orderId',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
  }
}
