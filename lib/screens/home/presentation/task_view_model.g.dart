// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksViewModel on TasksViewModelBase, Store {
  late final _$taskListAtom =
      Atom(name: 'TasksViewModelBase.taskList', context: context);

  @override
  ObservableList<Task> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<Task> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$addTaskAsyncAction =
      AsyncAction('TasksViewModelBase.addTask', context: context);

  @override
  Future<void> addTask(Task task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  late final _$reduceTaskTimeAsyncAction =
      AsyncAction('TasksViewModelBase.reduceTaskTime', context: context);

  @override
  Future<void> reduceTaskTime({required int index}) {
    return _$reduceTaskTimeAsyncAction
        .run(() => super.reduceTaskTime(index: index));
  }

  late final _$stopTaskTimeAsyncAction =
      AsyncAction('TasksViewModelBase.stopTaskTime', context: context);

  @override
  Future<void> stopTaskTime({required int index}) {
    return _$stopTaskTimeAsyncAction
        .run(() => super.stopTaskTime(index: index));
  }

  late final _$setTaskAsCompleteAsyncAction =
      AsyncAction('TasksViewModelBase.setTaskAsComplete', context: context);

  @override
  Future<void> setTaskAsComplete({required int index}) {
    return _$setTaskAsCompleteAsyncAction
        .run(() => super.setTaskAsComplete(index: index));
  }

  @override
  String toString() {
    return '''
taskList: ${taskList}
    ''';
  }
}
