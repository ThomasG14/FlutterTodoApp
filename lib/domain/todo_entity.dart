sealed class TodoEntity {
  const TodoEntity({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
}

class LowTodoEntity extends TodoEntity {
  const LowTodoEntity({
    required super.title,
    required super.subtitle,
  });
}

class MediumTodoEntity extends TodoEntity {
  const MediumTodoEntity({
    required super.title,
    required super.subtitle,
  });
}

class HighTodoEntity extends TodoEntity {
  const HighTodoEntity({
    required super.title,
    required super.subtitle,
  });
}

extension TodoEntityExt on TodoEntity {
  T when<T>({
    required T Function(String, String) onLow,
    required T Function(String, String) onMedium,
    required T Function(String, String) onHigh,
  }) {
    return switch (this) {
      LowTodoEntity(:final title, :final subtitle) =>
          onLow(title, subtitle),
      MediumTodoEntity(:final title, :final subtitle) =>
        onMedium(title, subtitle),
      HighTodoEntity(:final title, :final subtitle) =>
          onHigh(title, subtitle),
    };
  }
}
