import 'package:flutter/material.dart';
import 'package:todo_app/screens/addScreen/add_page.dart';
import 'package:todo_app/screens/todoscreen/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home:const TodoListPagState() ,
      initialRoute: "/",
      routes: {
        "/": (context) => const TodoListPagState(),
        "/addpagelist": (context) => const AddPageList(),
      },
    );
  }
}
