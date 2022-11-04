class AddScheduleModel {
  String id;
  Map<String, String> schedule;
  bool mounted;
  String day;
  String discipline;
  String duration;

  AddScheduleModel({
    required this.id,
    required this.schedule,
    required this.mounted,
    required this.day,
    required this.discipline,
    required this.duration,
  });
}
