part of 'todo_bloc.dart';

// sealed class TodoState extends Equatable {
//   const TodoState();

//   @override
//   List<Object> get props => [];
// }

// final class TodoInitial extends TodoState {}

enum TodoStatus { initial, loading, success, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;
  // final String message;

  const TodoState({
    this.todos = const <Todo>[],
    this.status = TodoStatus.initial,
    // this.message = '',
  });

  TodoState copyWith({
    List<Todo>? todos,
    TodoStatus? status,
    // String? message,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      // message: message ?? this.message,
    );
  }

  @override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();

      return TodoState(
          todos: listOfTodos,
          status: TodoStatus.values.firstWhere(
              (element) => element.name.toString() == json['status']));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {'todo': todos, 'status': status.name};
  }

  @override
  List<Object?> get props => [todos, status];

  // @override
  // String toString() => 'TodoState { todos: $todos, status: $status }';
}
