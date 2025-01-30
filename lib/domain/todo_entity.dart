sealed class TodoEntity {
  const TodoEntity({required this.title});
  final String title;
}

class LowTodoEntity extends TodoEntity {
  const LowTodoEntity({required super.title});
}

class MediumTodoEntity extends TodoEntity {
  const MediumTodoEntity({
    required super.title,
    required this.subtitle,
  });
  final String subtitle;
}

class HighTodoEntity extends TodoEntity {
  const HighTodoEntity({required super.title});
}

extension TodoEntityExt on TodoEntity {
  T when<T>({
    required T Function(String) onLow,
    required T Function(String, String) onMedium,
    required T Function(String) onHigh,
  }) {
    return switch (this) {
      LowTodoEntity(:final title) => onLow(title),
      MediumTodoEntity(:final title, :final subtitle) =>
        onMedium(title, subtitle),
      HighTodoEntity(:final title) => onHigh(title),
    };
  }
}
