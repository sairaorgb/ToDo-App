import 'package:hive/hive.dart';

class Database {
  var mybox = Hive.box('myBox');

  List tasks = [];
  void initDatabase() {
    tasks = [
      ["task1", false],
      ["task2", true]
    ];
    mybox.put("ToDo", tasks);
  }

  void updateDatabase() {
    mybox.put("ToDo", tasks);
  }

  void getDatabase() {
    tasks = mybox.get("ToDo");
  }
}
