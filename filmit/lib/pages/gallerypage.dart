import 'package:filmit/components/header.dart';
import 'package:filmit/components/tasklist_entry.dart';
import 'package:filmit/models/tasklist.dart';
import 'package:filmit/pages/loginpage.dart';
import 'package:filmit/provider/colorprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {

  const Homepage({
    super.key
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
  final colors = Provider.of<ColorProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 7, // 1 for Header + 6 for TaskListEntry items
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSpace(headerText: "Omat listat"),
                  SizedBox(height: 30.0),
                ],
              );
            } else {
              return TaskListEntry(
                tasklist: Tasklist(
                  id: (index - 1).toString(),
                  tasklistname: "Tehtävälista " + (index - 1).toString(),
                  bucketId: "bucketId",
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: 'Menu',
            backgroundColor: colors.lightgreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add bucket',
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
              MaterialPageRoute(builder: (context) => const LoginPage()),
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