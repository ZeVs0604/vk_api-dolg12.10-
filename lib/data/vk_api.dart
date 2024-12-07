import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/apps_response.dart';

class VkApi {
  final String _serviceKey = 'b2f7f28eb2f7f28eb2f7f28edab1ea847dbb2f7b2f7f28ed42e20f1e16698f19e7ebe0d';
  final String _baseUrl = 'https://api.vk.com/method/apps.get';

  Future<String> getApps() async {
    final response = await http.get(Uri.parse('$_baseUrl?access_token=$_serviceKey&v=5.131'));

    if (response.statusCode == 200) {
      return response.body; // Возвращаем JSON в виде строки
    } else {
      throw Exception('Failed to load apps');
    }
  }

  Future<AppsResponse> fetchApps() async {
    final response = await http.get(Uri.parse('$_baseUrl?access_token=$_serviceKey&v=5.131'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return AppsResponse.fromJson(jsonResponse['response']);
    } else {
      throw Exception('Failed to load apps');
    }
  }
}