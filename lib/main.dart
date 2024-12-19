import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodoStore todoStore = TodoStore();
  final TextEditingController textController = TextEditingController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'alphabetical' || value == 'createdAt') {
                  todoStore.setSortCriterion(value);
                } else {
                  todoStore.setFilter(value);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'all',
                  child: Text('All'),
                ),
                const PopupMenuItem(
                  value: 'completed',
                  child: Text('Completed'),
                ),
                const PopupMenuItem(
                  value: 'incomplete',
                  child: Text('Incomplete'),
                ),
                const PopupMenuItem(
                  value: 'alphabetical',
                  child: Text('Alphabetical'),
                ),
                const PopupMenuItem(
                  value: 'createdAt',
                  child: Text('Date Created'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          todoStore.addTodo(value);
                          textController.clear();
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Adicionar Tarefa',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            final value = textController.text;
                            if (value.isNotEmpty) {
                              todoStore.addTodo(value);
                              textController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: TodoList(todoStore: todoStore)),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  final TodoStore todoStore;

  const TodoList({super.key, required this.todoStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        itemCount: todoStore.filteredTodos.length,
        itemBuilder: (context, index) {
          final todo = todoStore.filteredTodos[index];
          final textEditingController =
              TextEditingController(text: todo.description);

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      todoStore.updateTodoDescription(index, value);
                    }
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    decoration:
                        todo.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                leading: Checkbox(
                  value: todo.completed,
                  onChanged: (value) {
                    todoStore.toggleTodoStatus(index);
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoStore.removeTodo(index);
                  },
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
