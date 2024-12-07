import 'app.dart';

class AppCatalogResponse {
  final List<App> apps;

  AppCatalogResponse({required this.apps});

  factory AppCatalogResponse.fromJson(Map<String, dynamic> json) {
    var appsJson = json['items'] as List;
    List<App> appsList = appsJson.map((app) => App.fromJson(app)).toList();
    return AppCatalogResponse(apps: appsList);
  }
}