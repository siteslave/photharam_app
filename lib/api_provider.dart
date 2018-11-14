import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl = 'https://randomuser.me/api/?results=50';
  String endPoint = 'http://192.168.7.69:3000';

  Future<http.Response> getUsers() async {
    return await http.get(apiUrl);
  }

  Future<http.Response> doLogin(String username, String password) async {
    return await http.post('$endPoint/login',
        body: {'username': username, 'password': password});
  }
}
