import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/app.dart';
import 'package:propusk1210/token.dart';

class ApiService {
  final String _apiKey = token;
  final String _baseUrl = 'https://api.vk.com/method/apps.getCatalog';

  Future<List<App>> fetchApps() async {
    final response = await http.get(Uri.parse('$_baseUrl?access_token=$_apiKey&v=5.131'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['response']['items'];
      return items.map((item) => App.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load apps');
    }
  }
}