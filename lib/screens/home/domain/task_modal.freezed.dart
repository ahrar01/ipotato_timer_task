// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  String get taskID => throw _privateConstructorUsedError;
  set taskID(String value) => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  set taskName(String value) => throw _privateConstructorUsedError;
  String get taskDescription => throw _privateConstructorUsedError;
  set taskDescription(String value) => throw _privateConstructorUsedError;
  bool get taskComplete => throw _privateConstructorUsedError;
  set taskComplete(bool value) => throw _privateConstructorUsedError;
  bool get isTimerStart => throw _privateConstructorUsedError;
  set isTimerStart(bool value) => throw _privateConstructorUsedError;
  Duration get taskDuration => throw _privateConstructorUsedError;
  set taskDuration(Duration value) => throw _privateConstructorUsedError;
  Timer? get ownTimer => throw _privateConstructorUsedError;
  set ownTimer(Timer? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String taskID,
      String taskName,
      String taskDescription,
      bool taskComplete,
      bool isTimerStart,
      Duration taskDuration,
      Timer? ownTimer});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskID = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? taskComplete = null,
    Object? isTimerStart = null,
    Object? taskDuration = null,
    Object? ownTimer = freezed,
  }) {
    return _then(_value.copyWith(
      taskID: null == taskID
          ? _value.taskID
          : taskID // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      taskComplete: null == taskComplete
          ? _value.taskComplete
          : taskComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimerStart: null == isTimerStart
          ? _value.isTimerStart
          : isTimerStart // ignore: cast_nullable_to_non_nullable
              as bool,
      taskDuration: null == taskDuration
          ? _value.taskDuration
          : taskDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      ownTimer: freezed == ownTimer
          ? _value.ownTimer
          : ownTimer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taskID,
      String taskName,
      String taskDescription,
      bool taskComplete,
      bool isTimerStart,
      Duration taskDuration,
      Timer? ownTimer});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskID = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? taskComplete = null,
    Object? isTimerStart = null,
    Object? taskDuration = null,
    Object? ownTimer = freezed,
  }) {
    return _then(_$_Task(
      taskID: null == taskID
          ? _value.taskID
          : taskID // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      taskComplete: null == taskComplete
          ? _value.taskComplete
          : taskComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimerStart: null == isTimerStart
          ? _value.isTimerStart
          : isTimerStart // ignore: cast_nullable_to_non_nullable
              as bool,
      taskDuration: null == taskDuration
          ? _value.taskDuration
          : taskDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      ownTimer: freezed == ownTimer
          ? _value.ownTimer
          : ownTimer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc

class _$_Task implements _Task {
  _$_Task(
      {required this.taskID,
      required this.taskName,
      required this.taskDescription,
      required this.taskComplete,
      this.isTimerStart = false,
      required this.taskDuration,
      this.ownTimer});

  @override
  String taskID;
  @override
  String taskName;
  @override
  String taskDescription;
  @override
  bool taskComplete;
  @override
  @JsonKey()
  bool isTimerStart;
  @override
  Duration taskDuration;
  @override
  Timer? ownTimer;

  @override
  String toString() {
    return 'Task(taskID: $taskID, taskName: $taskName, taskDescription: $taskDescription, taskComplete: $taskComplete, isTimerStart: $isTimerStart, taskDuration: $taskDuration, ownTimer: $ownTimer)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task implements Task {
  factory _Task(
      {required String taskID,
      required String taskName,
      required String taskDescription,
      required bool taskComplete,
      bool isTimerStart,
      required Duration taskDuration,
      Timer? ownTimer}) = _$_Task;

  @override
  String get taskID;
  set taskID(String value);
  @override
  String get taskName;
  set taskName(String value);
  @override
  String get taskDescription;
  set taskDescription(String value);
  @override
  bool get taskComplete;
  set taskComplete(bool value);
  @override
  bool get isTimerStart;
  set isTimerStart(bool value);
  @override
  Duration get taskDuration;
  set taskDuration(Duration value);
  @override
  Timer? get ownTimer;
  set ownTimer(Timer? value);
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
