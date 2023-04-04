import 'package:flutter/material.dart';

import '../widgets/add_todo_text_field.dart';
import '../widgets/app_title.dart';
import '../widgets/filters.dart';
import '../widgets/search_box.dart';
import '../widgets/todo_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppTitle(),
                AddTodoTextField(),
                SizedBox(
                  height: 15,
                ),
                SearchBox(),
                SizedBox(
                  height: 15,
                ),
                Filters(),
                SizedBox(
                  height: 15,
                ),
                TodoList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
