import 'package:doit/utils/color.dart';
import 'package:flutter/widgets.dart';

class GoalModel {
  late String? id;
  late Color color;
  late String name;
  late String? createdAt;
  late String? deletedAt;
  late String? updatedAt;
  late String? userId;

  static String collectionName = 'goals';

  GoalModel({
    required this.color,
    required this.name,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.userId,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': ColorUtil.toText(color),
      'createdAt': createdAt,
      'deletedAt': deletedAt,
      'updatedAt': updatedAt,
      'userId': userId,
    };
  }

  GoalModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.color = ColorUtil.toColor(json['color']);
    this.createdAt = json['createdAt'];
    this.deletedAt = json['deletedAt'];
    this.updatedAt = json['updatedAt'];
    this.userId = json['userId'];
  }
}
