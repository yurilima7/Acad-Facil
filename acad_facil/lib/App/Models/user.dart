import 'package:flutter/widgets.dart';

class User with ChangeNotifier{
  String id;
  String name;
  String course;
  int period;

  User({
    this.id = '',
    this.name = '',
    this.course = '',
    this.period = 1,
  });
}