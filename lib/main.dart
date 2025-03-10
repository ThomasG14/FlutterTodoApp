import 'package:flutter/material.dart';
import 'package:todo_berserk/domain/todo_entity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Todo App test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Liste des todo items

  late List<TodoEntity> _todos = [
    const HighTodoEntity(title: 'Apprendre Flutter', subtitle: 'Les base et concept'),
    const MediumTodoEntity(title: 'Apprendre Flutter', subtitle: 'Créer une app Todo'),
    const LowTodoEntity(title: 'Apprendre Flutter', subtitle: 'devenir plus fort que Yann'),
  ];


  // Fonction pour ajouter un todo
  void _addTodo() {
    setState(() {
      _todos.add(
        const LowTodoEntity(title: 'nouvelle tache', subtitle: 'nouvelle tache')
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Afficher la liste des todos
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todos[index].title),
                    subtitle: Text(_todos[index].subtitle),
                  );
                },
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Ajouter une tâche',
        child: const Icon(Icons.add),
      ),
    );
  }
}
