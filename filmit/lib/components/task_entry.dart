import 'package:filmit/models/task.dart';
import 'package:flutter/material.dart';
import 'package:filmit/provider/colorprovider.dart';
import 'package:provider/provider.dart';

class TaskEntry extends StatefulWidget {
  final Task task;
  final String taskstate;

  const TaskEntry({
    super.key,
    required this.task,
    required this.taskstate,
  });
    @override
  _TaskEntryState createState() => _TaskEntryState();
}

class _TaskEntryState extends State<TaskEntry> {
  bool isChecked = false; // State for checkbox

  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<ColorProvider>(context);
    return
      SizedBox(
        width: double.infinity,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    child: Text(
                      widget.taskstate,
                      style: TextStyle(
                        color: colors.textColorLight
                      ),
                    ),
                  ),
                  Text(
                    widget.task.taskname[0].toUpperCase()+widget.task.taskname.substring(1),
                    style: TextStyle(
                      fontSize: 24.0,
                      color: colors.textColorDark
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: ()=> {},
                iconSize: 32.0, 
                icon: Icon(Icons.photo_camera))
            ],
          ),
        )
      );
  }
}