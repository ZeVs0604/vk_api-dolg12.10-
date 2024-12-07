import 'app.dart';

class AppsResponseDto {
  final int count;
  final List<AppDto> items;

  AppsResponseDto({
    required this.count,
    required this.items,
  });

  factory AppsResponseDto.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<AppDto> appsList = itemsList.map((i) => AppDto.fromJson(i)).toList();
    return AppsResponseDto(
      count: json['count'],
      items: appsList,
    );
  }
}