import 'package:filmit/components/header.dart';
import 'package:filmit/components/task_entry.dart';
import 'package:filmit/models/task.dart';
import 'package:filmit/pages/homepage.dart';
import 'package:filmit/provider/colorprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Taskpage extends StatefulWidget {
  final String tasklistId;

  const Taskpage({
    super.key,
    required this.tasklistId,
  });

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
  final colors = Provider.of<ColorProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 17, // 1 for Header + 6 for TaskListEntry items
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSpace(headerText: "Tehtävälista"),
                  SizedBox(height: 30.0), 
                ],
              );
            } else {
              return TaskEntry(
                task: Task(
                  id: index.toString(), 
                  taskname: "taskname", 
                  listId: "listId"
                  ), 
                taskstate: "Unfinished"
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: colors.lightgreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Photo',
            backgroundColor: colors.lightgreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
            backgroundColor: colors.lightgreen,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (_selectedIndex) {
          if (_selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          } else if (_selectedIndex == 1) {
            //
          } else{
            //
          }
        },
      ),
    );
  }
}