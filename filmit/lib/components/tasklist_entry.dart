import 'package:filmit/models/tasklist.dart';
import 'package:filmit/pages/taskpage.dart';
import 'package:flutter/material.dart';
import 'package:filmit/provider/colorprovider.dart';
import 'package:provider/provider.dart';

class TaskListEntry extends StatefulWidget {
  final Tasklist tasklist;

  const TaskListEntry({
    super.key,
    required this.tasklist,
  });
    @override
  _TaskListEntryState createState() => _TaskListEntryState();
}

class _TaskListEntryState extends State<TaskListEntry> {
  bool isChecked = false; // State for checkbox

  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<ColorProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Taskpage(tasklistId: widget.tasklist.bucketId), //Annetaan siirryttävälle sivulle listanid, millä täyttää tehtävälista
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 100.0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 26.0),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: colors.secondary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🎉"+widget.tasklist.tasklistname[0].toUpperCase()+widget.tasklist.tasklistname.substring(1),
                style: TextStyle(
                  fontSize: 24.0,
                  color: colors.textColorDark
                ),
              ),
            ],
          )
        )
      )
    );
  }
}