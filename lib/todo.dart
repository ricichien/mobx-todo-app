import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'todo.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  String filter = 'all';

  @observable
  String sortCriterion = 'alphabetical';

  _TodoStoreBase() {
    _loadTodos();
  }

  @computed
  ObservableList<Todo> get filteredTodos {
    ObservableList<Todo> filteredList;
    switch (filter) {
      case 'completed':
        filteredList = ObservableList.of(todos.where((todo) => todo.completed));
        break;
      case 'incomplete':
        filteredList =
            ObservableList.of(todos.where((todo) => !todo.completed));
        break;
      default:
        filteredList = todos;
    }
    return _sortTodos(filteredList);
  }

  @computed
  int get totalTodos => todos.length;

  @computed
  int get completedTodos => todos.where((todo) => todo.completed).length;

  @computed
  int get incompleteTodos => todos.where((todo) => !todo.completed).length;

  @action
  void setFilter(String value) {
    filter = value;
  }

  @action
  void setSortCriterion(String value) {
    sortCriterion = value;
  }

  @action
  void addTodo(String description) {
    todos.add(Todo(description: description));
    _saveTodos();
  }

  @action
  void removeTodo(int index) {
    todos.removeAt(index);
    _saveTodos();
  }

  @action
  void toggleTodoStatus(int index) {
    todos[index].toggleStatus();
    _saveTodos();
  }

  @action
  void updateTodoDescription(int index, String description) {
    todos[index].description = description;
    _saveTodos();
  }

  ObservableList<Todo> _sortTodos(ObservableList<Todo> todosList) {
    final sortedList = List<Todo>.from(todosList);
    switch (sortCriterion) {
      case 'createdAt':
        sortedList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case 'alphabetical':
      default:
        sortedList.sort((a, b) => a.description.compareTo(b.description));
    }
    return ObservableList.of(sortedList);
  }

  @action
  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = prefs.getString('todos');
    if (todosString != null) {
      final List<dynamic> todosJson = jsonDecode(todosString);
      todos = ObservableList.of(
          todosJson.map((json) => Todo.fromJson(json)).toList());
    }
  }

  @action
  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    prefs.setString('todos', todosJson);
  }
}

class Todo {
  @observable
  String description;

  @observable
  bool completed = false;

  DateTime createdAt;

  Todo({
    required this.description,
    this.completed = false,
  }) : createdAt = DateTime.now();

  @action
  void toggleStatus() {
    completed = !completed;
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'completed': completed,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      description: json['description'] as String,
      completed: json['completed'] as bool,
    )..createdAt = DateTime.parse(json['createdAt'] as String);
  }
}
