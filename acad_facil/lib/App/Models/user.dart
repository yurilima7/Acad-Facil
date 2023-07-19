class UserModel {
  final String id;
  final String name;
  final String course;
  final int period;
  final String perfilUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.course,
    required this.period,
    this.perfilUrl = '',
  });
}
