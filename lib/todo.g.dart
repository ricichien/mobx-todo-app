// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStoreBase, Store {
  Computed<ObservableList<Todo>>? _$filteredTodosComputed;

  @override
  ObservableList<Todo> get filteredTodos => (_$filteredTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.filteredTodos,
              name: '_TodoStoreBase.filteredTodos'))
      .value;
  Computed<int>? _$totalTodosComputed;

  @override
  int get totalTodos =>
      (_$totalTodosComputed ??= Computed<int>(() => super.totalTodos,
              name: '_TodoStoreBase.totalTodos'))
          .value;
  Computed<int>? _$completedTodosComputed;

  @override
  int get completedTodos =>
      (_$completedTodosComputed ??= Computed<int>(() => super.completedTodos,
              name: '_TodoStoreBase.completedTodos'))
          .value;
  Computed<int>? _$incompleteTodosComputed;

  @override
  int get incompleteTodos =>
      (_$incompleteTodosComputed ??= Computed<int>(() => super.incompleteTodos,
              name: '_TodoStoreBase.incompleteTodos'))
          .value;

  late final _$todosAtom = Atom(name: '_TodoStoreBase.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_TodoStoreBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$sortCriterionAtom =
      Atom(name: '_TodoStoreBase.sortCriterion', context: context);

  @override
  String get sortCriterion {
    _$sortCriterionAtom.reportRead();
    return super.sortCriterion;
  }

  @override
  set sortCriterion(String value) {
    _$sortCriterionAtom.reportWrite(value, super.sortCriterion, () {
      super.sortCriterion = value;
    });
  }

  late final _$_loadTodosAsyncAction =
      AsyncAction('_TodoStoreBase._loadTodos', context: context);

  @override
  Future<void> _loadTodos() {
    return _$_loadTodosAsyncAction.run(() => super._loadTodos());
  }

  late final _$_saveTodosAsyncAction =
      AsyncAction('_TodoStoreBase._saveTodos', context: context);

  @override
  Future<void> _saveTodos() {
    return _$_saveTodosAsyncAction.run(() => super._saveTodos());
  }

  late final _$_TodoStoreBaseActionController =
      ActionController(name: '_TodoStoreBase', context: context);

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortCriterion(String value) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.setSortCriterion');
    try {
      return super.setSortCriterion(value);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(String description) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.addTodo');
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(int index) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.removeTodo');
    try {
      return super.removeTodo(index);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTodoStatus(int index) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.toggleTodoStatus');
    try {
      return super.toggleTodoStatus(index);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTodoDescription(int index, String description) {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.updateTodoDescription');
    try {
      return super.updateTodoDescription(index, description);
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
sortCriterion: ${sortCriterion},
filteredTodos: ${filteredTodos},
totalTodos: ${totalTodos},
completedTodos: ${completedTodos},
incompleteTodos: ${incompleteTodos}
    ''';
  }
}
