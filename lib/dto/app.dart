class AppDto {
  final String type;
  final int id;
  final String title;
  final int mobileControlsType;

  AppDto({
    required this.type,
    required this.id,
    required this.title,
    required this.mobileControlsType,
  });

  factory AppDto.fromJson(Map<String, dynamic> json) {
    return AppDto(
      type: json['type'],
      id: json['id'],
      title: json['title'],
      mobileControlsType: json['mobile_controls_type'],
    );
  }
}