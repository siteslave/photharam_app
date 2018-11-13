import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl = 'https://randomuser.me/api/?results=50';

  Future<http.Response> getUsers() async {
    return await http.get(apiUrl);
  }
}
