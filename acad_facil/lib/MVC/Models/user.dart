import 'package:flutter/widgets.dart';

class User with ChangeNotifier{
  String id;
  String name;
  String course;
  int period;

  User({
    required this.id,
    required this.name,
    required this.course,
    required this.period,
  });
}