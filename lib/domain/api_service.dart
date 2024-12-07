import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/apps_response.dart';
import '../token.dart';
import 'app.dart';

class ApiService {
  final String _serviceKey = serviceKey;
  final String _baseUrl = 'https://api.vk.com/method/apps.get';

  Future<String> getApps() async {
    final response = await http.get(Uri.parse('$_baseUrl?access_token=$_serviceKey&v=5.131'));

    if (response.statusCode == 200) {
      return response.body; // Возвращаем JSON в виде строки
    } else {
      throw Exception('Failed to load apps');
    }
  }

  Future<AppsResponseDto> fetchApps() async {
    final response = await http.get(Uri.parse('$_baseUrl?access_token=$_serviceKey&v=5.131'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return AppsResponseDto.fromJson(jsonResponse['response']);
    } else {
      throw Exception('Failed to load apps');
    }
  }
}