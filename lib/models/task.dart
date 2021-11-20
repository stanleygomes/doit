class TaskModel {
  late String? id;
  late String text;
  late String collection;
  late bool checked;
  late Function(bool?)? onChanged;
  late String? createdAt;
  late String? deletedAt;
  late String? updatedAt;
  late String? userId;

  static String collectionName = 'tasks';

  TaskModel({
    required this.text,
    required this.collection,
    required this.checked,
    this.onChanged,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.userId,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'collection': collection,
      'checked': checked,
      'onChanged': onChanged,
      'createdAt': createdAt,
      'deletedAt': deletedAt,
      'updatedAt': updatedAt,
      'userId': userId,
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.text = json['text'];
    this.collection = json['collection'];
    this.checked = json['checked'];
    this.onChanged = json['onChanged'];
    this.createdAt = json['createdAt'];
    this.deletedAt = json['deletedAt'];
    this.updatedAt = json['updatedAt'];
    this.userId = json['userId'];
  }
}
