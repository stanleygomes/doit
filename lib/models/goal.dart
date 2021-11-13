import 'package:doit/services/color_util.dart';
import 'package:flutter/widgets.dart';

class GoalModel {
  late String? id;
  late Color color;
  late String name;

  static String collectionName = 'goals';

  GoalModel({
    required this.color,
    required this.name,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': ColorUtil.toText(color),
    };
  }

  fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.color = json['color'];
  }
}
