import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/providers/providers.dart';
import 'package:sketchtrail/utils/date_utils.dart';

class TaskboardPage extends ConsumerStatefulWidget {
  const TaskboardPage({super.key});

  @override
  ConsumerState<TaskboardPage> createState() => _TaskboardPageState();
}

class _TaskboardPageState extends ConsumerState<TaskboardPage> {
  DateTime _selectedDate = stripTime(DateTime.now());

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = stripTime(picked));
    }
  }

  void _changeDay(int offset) {
    setState(() {
      _selectedDate = stripTime(_selectedDate.add(Duration(days: offset)));
    });
  }

  Future<void> _showTaskSheet({Task? task}) async {
    final controller = TextEditingController(text: task?.title ?? '');

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                task == null ? 'Add Task' : 'Edit Task',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Task',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_) =>
                    _saveTask(sheetContext, controller.text, task),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => _saveTask(sheetContext, controller.text, task),
                child: Text(task == null ? 'Add Task' : 'Save'),
              ),
            ],
          ),
        );
      },
    );
    controller.dispose();
  }

  Future<void> _saveTask(
    BuildContext sheetContext,
    String title,
    Task? task,
  ) async {
    final normalizedTitle = title.trim();
    if (normalizedTitle.isEmpty) return;

    final repository = ref.read(taskRepoProvider);
    if (task == null) {
      await repository.addTask(title: normalizedTitle, taskDate: _selectedDate);
    } else {
      await repository.updateTaskTitle(task.id, normalizedTitle);
    }

    if (sheetContext.mounted) {
      Navigator.of(sheetContext).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(taskRepoProvider);
    final dateLabel = DateFormat.yMMMMd().format(_selectedDate);

    return Scaffold(
      appBar: AppBar(title: const Text('Taskboard')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Previous day',
                  onPressed: () => _changeDay(-1),
                  icon: const Icon(Icons.chevron_left),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _pickDate,
                    child: Text(
                      dateLabel,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Next day',
                  onPressed: () => _changeDay(1),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: StreamBuilder<List<Task>>(
              stream: repository.watchTasksForDate(_selectedDate),
              builder: (context, snapshot) {
                final tasks = snapshot.data ?? const <Task>[];

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting &&
                    snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (tasks.isEmpty) {
                  return const Center(child: Text('No tasks for this day.'));
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return CheckboxListTile(
                      value: task.done,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        task.title,
                        style: task.done
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              )
                            : null,
                      ),
                      secondary: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Edit task',
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () => _showTaskSheet(task: task),
                          ),
                          IconButton(
                            tooltip: 'Delete task',
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => repository.deleteTask(task.id),
                          ),
                        ],
                      ),
                      onChanged: (_) => repository.toggleTask(task),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskSheet(),
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
