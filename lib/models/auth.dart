import 'package:doit/models/goal.dart';
import 'package:doit/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:doit/models/user.dart';

class AuthModel extends ChangeNotifier {
  late UserModel? _user;
  late List<TaskModel> _taskList = [];
  late List<GoalModel> _goalList = [];

  UserModel? get user => _user;
  List<TaskModel> get taskList => _taskList;
  List<GoalModel> get goalList => _goalList;

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

  setGoalList(List<GoalModel> goalList) {
    _goalList = goalList;
    notifyListeners();
  }

  addGoal(newGoal) {
    List<GoalModel> goalsUpdate = _goalList;
    goalsUpdate.add(newGoal);
    _goalList = goalsUpdate;

    notifyListeners();
  }
}
