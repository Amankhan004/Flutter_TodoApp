import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_lists.dart';

class TodoListPagState extends StatefulWidget {
  const TodoListPagState({super.key});

  @override
  State<TodoListPagState> createState() => _TodoListPagStateState();
}

class _TodoListPagStateState extends State<TodoListPagState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo List")),
      ),
      body: ListView.builder(
          itemCount: AppList.titleLists.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(AppList.titleLists[index]),
                subtitle: Text(AppList.discriptionLists[index]),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == "Edit") {
                    } else {
                      setState(() {
                        AppList.titleLists.removeAt(index);
                        AppList.discriptionLists.removeAt(index);
                      });
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(value: "Edit", child: Text("Edit")),
                      const PopupMenuItem(
                          value: "Delete", child: Text("Delete"))
                    ];
                  },
                ));
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage,
          label: const Center(child: Text("Add todo"))),
    );
  }

  void navigateToAddPage() async {
    // Navigate to the add page and wait for the result
    final result = await Navigator.pushNamed(context, "/addpagelist");

    if (result != null && result is Map<String, dynamic>) {
      // Handle the data passed back from AddPageList
      String? title = result['title'];
      String? description = result['description'];

      if (title != null && description != null) {
        setState(() {
          // Add the newly added item to your lists
          AppList.titleLists.add(title);
          AppList.discriptionLists.add(description);
        });
      }
    }
  }
}
