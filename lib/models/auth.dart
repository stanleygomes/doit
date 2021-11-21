import 'package:doit/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:doit/models/user.dart';

class AuthModel extends ChangeNotifier {
  late UserModel? _user;
  late List<TaskModel> _taskList = [];

  UserModel? get user => _user;
  List<TaskModel> get taskList => _taskList;

  setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  setTaskList(List<TaskModel> taskList) {
    _taskList = taskList;
    notifyListeners();
  }

  addTask(newTask) {
    List<TaskModel> tasksUpdate = _taskList;
    tasksUpdate.add(newTask);
    _taskList = tasksUpdate;

    notifyListeners();
  }
}
