import 'package:drift/drift.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/utils/date_utils.dart';

class TaskRepository {
  final AppDatabase _db;

  TaskRepository(this._db);

  Stream<List<Task>> watchTasksForDate(DateTime date) {
    final normalizedDate = stripTime(date);
    return (_db.select(
      _db.tasks,
    )..where((tbl) => tbl.taskDate.equals(normalizedDate))).watch();
  }

  Future<int> addTask({required String title, required DateTime taskDate}) {
    return _db
        .into(_db.tasks)
        .insert(
          TasksCompanion.insert(
            title: title.trim(),
            taskDate: stripTime(taskDate),
          ),
        );
  }

  Future<int> updateTaskTitle(int id, String title) {
    return (_db.update(_db.tasks)..where((tbl) => tbl.id.equals(id))).write(
      TasksCompanion(title: Value(title.trim())),
    );
  }

  Future<int> toggleTask(Task task) {
    return (_db.update(_db.tasks)..where((tbl) => tbl.id.equals(task.id)))
        .write(TasksCompanion(done: Value(!task.done)));
  }

  Future<int> deleteTask(int id) {
    return (_db.delete(_db.tasks)..where((tbl) => tbl.id.equals(id))).go();
  }
}
