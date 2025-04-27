import 'package:flutter/material.dart';
import 'package:markitup/components/searchbar_fullwdh.dart';
import 'package:markitup/components/task_entry.dart';
import 'package:markitup/models/task.dart';
import 'package:markitup/provider/colorprovider.dart';
import 'package:markitup/provider/taskprovider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});
  @override
  TaskPageState createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  final TextEditingController _searchfiltercontroller = TextEditingController();
  int _selectedIndex = 0;
  List<Task> filteredTasks = [];


  @override
  void initState() {
    super.initState();
    filteredTasks = context.read<Taskprovider>().tasks;
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    void _searchfilter(String query) {
  setState(() {
    filteredTasks = context.read<Taskprovider>().tasks // Get the full list of entries
        .where((task) => task.getTaskname().toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<ColorProvider>(context);
    final taskprovider = Provider.of<Taskprovider>(context);
    const addtasktooltip = 'Add task';
    return Scaffold(
      backgroundColor: colors.secondary,
      appBar: AppBar(
      backgroundColor: colors.secondary,
      iconTheme: IconThemeData(color: colors.primary),
      centerTitle: true,
      title: Text(
        "Task listing",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: colors.primary,
        ),
      ),
      elevation: 0,
    ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(//--------SEARCH BAR--------
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: SearchbarFullwdh(
                txtColorLight: colors.textColorLGray,
                searchCallback: _searchfilter,
                searchController: _searchfiltercontroller,
                )
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: 2, //taskprovider.getLength()
                  itemBuilder: (context, index) {
                    Task tehtava = Task(id: '1', taskname: 'Tehtävälista',variables: ["Asennettu","Kytketty","Testattu"], listId: '1');//Task(1, 'Tehtävä', '1', ["Asennettu","Kytketty","Testattu"], false);//taskprovider.getTask(taskprovider.getLength()-(index+1))
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tehtava.variables.map((variable) {
                        return TaskEntry(
                          task: tehtava,
                          taskstate: variable,
                        );
                      }).toList(),
                    );
                  },
              )
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 70.0,
        child: FloatingActionButton(
          foregroundColor: colors.secondary,
          backgroundColor: colors.primary,
          onPressed: () {
                 // Add your onPressed code here!
          },
          child: const Icon(Icons.add_task_sharp),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        backgroundColor: colors.secondary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colors.secondary,
              ),
              child: Text(
                'Taskflow',
                style: TextStyle(
                  color: colors.textColorDark,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Option 1'),
              onTap: () {
                // Handle option 1
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('Option 2'),
              onTap: () {
                // Handle option 2
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Option 3'),
              onTap: () {
                // Handle option 3
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}