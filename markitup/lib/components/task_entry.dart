import 'package:flutter/material.dart';
import 'package:markitup/components/cstm_checkbox_round.dart';
import 'package:markitup/models/task.dart';
import 'package:markitup/provider/colorprovider.dart';
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
    const String addCommentTranslation = 'Add comment...';
    final colors = Provider.of<ColorProvider>(context);
    return
      SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
          height: 110.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    spacing: 25.0,
                    children: [
                      Text(
                        widget.task.taskname,
                        style: TextStyle(
                          color: colors.textColorDark
                        ),
                      ),
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
                      )
                    ],
                  ),
                  SizedBox(
                    width: 200, // Set a fixed width
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: addCommentTranslation,
                      )
                    )
                  ),
                ],
              ),
              CstmCheckboxRound(
                value: isChecked,
                onChanged: (newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
                activeColor: Colors.green, // Optional: Customize colors
                checkColor: Colors.white,
              ),
            ],
          ),
        )
      );
  }
}