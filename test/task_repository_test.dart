import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/data/task_repository.dart';

void main() {
  test('tasks are isolated by date and toggled state is persisted', () async {
    final database = AppDatabase(NativeDatabase.memory());
    final repository = TaskRepository(database);
    addTearDown(database.close);

    final today = DateTime(2026, 11, 21, 18, 30);
    final tomorrow = DateTime(2026, 11, 22, 6, 15);

    await repository.addTask(title: 'Today task', taskDate: today);
    await repository.addTask(title: 'Tomorrow task', taskDate: tomorrow);

    final todayTasks = await repository
        .watchTasksForDate(DateTime(2026, 11, 21, 23, 45))
        .first;
    expect(todayTasks.map((task) => task.title), ['Today task']);

    final todayTask = todayTasks.single;
    await repository.toggleTask(todayTask);

    final updatedTodayTasks = await repository.watchTasksForDate(today).first;
    expect(updatedTodayTasks.single.done, isTrue);

    await repository.updateTaskTitle(todayTask.id, 'Updated task');
    await repository.deleteTask(todayTask.id);
    expect(await repository.watchTasksForDate(today).first, isEmpty);
  });
}
