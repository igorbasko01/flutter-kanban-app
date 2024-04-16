import 'package:flutter/material.dart';

import 'models/task.dart';

void main() => runApp(KanbanApp());

class KanbanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KanbanScreen(),
    );
  }
}

class KanbanScreen extends StatefulWidget {
  @override
  _KanbanScreenState createState() => _KanbanScreenState();
}

class _KanbanScreenState extends State<KanbanScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Board'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Backlog'),
            Tab(text: 'In Progress'),
            Tab(text: 'Done'),
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TaskList(status: 'backlog'),
          TaskList(status: 'inProgress'),
          TaskList(status: 'done'),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add task screen.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  final String status;

  TaskList({required this.status});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          onTap: () {
            // Navigate to task details screen.
          },
        );
      }
    );
  }
}