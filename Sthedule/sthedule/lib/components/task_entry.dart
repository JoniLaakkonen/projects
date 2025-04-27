import 'package:flutter/material.dart';
import 'package:sthedule/models/work_entry.dart';

class TaskEntry extends StatelessWidget {
  final Color txtColorDark;
  final Color txtColorLightGrey;
  final Color txtColorGrey;
  final Color boxColor;
  final Color borderColor;
  final WorkEntry entry;

  const TaskEntry({
    super.key,
    required this.txtColorDark,
    required this.txtColorLightGrey,
    required this.txtColorGrey,
    required this.boxColor,
    required this.borderColor,
    required this.entry,
  });
  @override
  Widget build(BuildContext context) {
    const String addCommentTranslation = 'Add comment...';
    return(
      Expanded(//--------Task entry--------
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: boxColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    entry.getProject(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: txtColorDark,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${entry.getDate().day}.${entry.getDate().month}.${entry.getDate().year}',
                    style: TextStyle(
                      fontSize: 14,
                      color: txtColorLightGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 16.0,
                child: Text(
                  entry.getTask(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: txtColorDark,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  SizedBox(
                    width: 65.0,
                    child: Text(
                      '${TimeOfDay.fromDateTime(entry.getStartTime()).format(context)}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7.0,
                    child: Text('-',textAlign: TextAlign.center,),
                  ),
                  SizedBox(
                    width: 65.0,
                    child: Text(
                      '${TimeOfDay.fromDateTime(entry.getEndTime()).format(context)}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: addCommentTranslation,
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: txtColorLightGrey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5.0), // Adjust padding here
                  ),
                ),
              )
            ]
          )
        ),
      )
    );
  }
}