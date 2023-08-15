import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:todo_note/models/todo/todo.dart';
import 'package:todo_note/services/api_services.dart';
import 'package:todo_note/utils/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TODO NOTE'),
      ),
      body: FutureBuilder(
        future: Api().getTodo(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final Todo todo = Todo.fromJson(snapshot.data!);

          return todo.items.isEmpty
              ? const Center(child: Text('EMPTY TODO'))
              : ListView.builder(
                  itemCount: todo.items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Checkbox(
                      value: todo.items[index].isCompleted!,
                      onChanged: (value) async {
                        final response = await Api().check(
                            todo.items[index].id!,
                            value!,
                            todo.items[index].title!,
                            todo.items[index].description!);
                        log(response.toString());
                        snack(response['message'], context);
                        setState(() {});
                      },
                    ),
                    title: Text(todo.items[index].title!),
                    subtitle: Text(todo.items[index].description!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            dialog(context,
                                title: todo.items[index].title!,
                                description: todo.items[index].description!,
                                id: todo.items[index].id!);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final response =
                                await Api().deleteTodo(todo.items[index].id!);
                            log(response.toString());
                            snack(response['message'], context);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog(context);
        },
        child: const Icon(Icons.post_add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
    );
  }

  Future<dynamic> dialog(BuildContext context,
      {String? title, String? description, String? id}) {
    return showDialog(
      context: context,
      builder: (context) {
        TextEditingController titleCtr = TextEditingController(text: title);
        TextEditingController descCtr =
            TextEditingController(text: description);
        return AlertDialog(
          title: const Text("Add TODO"),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                TextField(
                  controller: titleCtr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Title'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descCtr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () async {
                  if (titleCtr.text.trim().isNotEmpty &&
                      descCtr.text.trim().isNotEmpty) {
                    if (id == null) {
                      final response = await Api().createTodo(
                          titleCtr.text.trim(), descCtr.text.trim());
                      log(response.toString());
                      snack(response['message'], context);
                      Navigator.of(context).pop();
                    } else {
                      final response = await Api()
                          .edit(id, titleCtr.text.trim(), descCtr.text.trim());
                      log(response.toString());
                      snack(response['message'], context);
                      Navigator.of(context).pop();
                    }
                    setState(() {});
                  }
                },
                child: const Text('Add'))
          ],
        );
      },
    );
  }
}
