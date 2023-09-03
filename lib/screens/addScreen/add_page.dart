import 'package:flutter/material.dart';

class AddPageList extends StatefulWidget {
  const AddPageList({super.key});

  @override
  State<AddPageList> createState() => _AddPageListState();
}

class _AddPageListState extends State<AddPageList> {
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Add Todo")),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: discriptionController,
            decoration: const InputDecoration(hintText: "Discription"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  // addToLists();
                  Navigator.of(context).pop({
                    'title': titleController.text,
                    'description': discriptionController.text,
                  });
                });
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
