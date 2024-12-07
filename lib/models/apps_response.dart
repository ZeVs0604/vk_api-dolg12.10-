import 'app.dart';

class AppsResponse {
  final int count;
  final List<App> items;

  AppsResponse({
    required this.count,
    required this.items,
  });

  factory AppsResponse.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<App> appsList = itemsList.map((i) => App.fromJson(i)).toList();
    return AppsResponse(
      count: json['count'],
      items: appsList,
    );
  }
}