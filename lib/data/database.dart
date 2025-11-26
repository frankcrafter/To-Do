import 'package:hive_ce_flutter/hive_flutter.dart';

class ToDoDatabase {
  List taskList = [];

  final _myBox = Hive.box("my_box");

  void createData() {
    taskList = [
      ['code new app', true],
      ['go to the gym', false],
    ];
  }

  void loadData() {
    taskList = _myBox.get("TASKLIST");
  }

  void updateData() {
    _myBox.put("TASKLIST", taskList);
  }
}
