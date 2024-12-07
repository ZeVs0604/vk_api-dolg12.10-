class App {
  final String type;
  final int id;
  final String title;
  final int mobileControlsType;

  App({
    required this.type,
    required this.id,
    required this.title,
    required this.mobileControlsType,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      type: json['type'],
      id: json['id'],
      title: json['title'],
      mobileControlsType: json['mobile_controls_type'],
    );
  }
}