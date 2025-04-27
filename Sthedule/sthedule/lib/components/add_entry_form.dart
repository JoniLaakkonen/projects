import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sthedule/components/fullwidth_btn.dart';
import 'package:sthedule/models/work_entry.dart';
import 'package:sthedule/provider/colorprovider.dart';
import 'package:sthedule/provider/workentry_provider.dart';

class AddEntryForm extends StatefulWidget{
  final VoidCallback btnCallBack;
  final Color txtColor;
  final Color btnColor;
  final Color txtColorDark;

  
  const AddEntryForm ({
    super.key,
    required this.btnCallBack,
    required this.btnColor,
    required this.txtColor,
    required this.txtColorDark,
  });

  @override
  AddEntryFormState createState() => AddEntryFormState();
}

const List<String> projectList = <String>['Projekti 1', 'Projekti 2', 'Projekti 3', 'Projekti 4'];
const List<String> taskList = <String>['Task 1', 'Task 2', 'Task 3', 'Task 4'];
const List<String> tagList = <String>['Tag 1', 'Tag 2', 'Tag 3', 'Tag 4'];
  
class AddEntryFormState extends State<AddEntryForm> {
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  final TextEditingController commentController = TextEditingController();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  bool _isTimerRunning = false;
  String projectValue = projectList.first;
  String taskValue = taskList.first;
  String tagValue = tagList.first;
  String _message = '';
  bool timerBox = true;
  final bool is24HourFormat = true;

  late WorkEntry selectedEntry;

  @override
  void initState() {
    super.initState();
    _startTime = const TimeOfDay(hour: 0, minute: 0);
    _endTime = const TimeOfDay(hour: 0, minute: 0);
  }

// This method shows a time picker and returns the selected time.
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
          _startController.text = _formatTime(picked);
        } else {
          _endTime = picked;
          _endController.text = _formatTime(picked);
        }
      });
    }
  }

  // Function to start or stop the timer
  void _toggleTimer() {
    setState(() {
      _isTimerRunning = !_isTimerRunning;
    });

    if (!_isTimerRunning){
      //start time == datetime.now();
      // ?? ==> starttime(time:datetime.now());
      
      /*DateTime selectedDate = DateTime.now();
      final workEntry = WorkEntry(
        projectValue,
        taskValue,
        tagValue,
        Provider.of<TimerProvider>(context, listen: false).startTimestamp,
        false,
        null,
      );
      Provider.of<WorkEntryProvider>(context, listen: false).addEntry(workEntry);
      */
    }else{
      //end time == datetime.now();
      // ?? ==> endtime(time:datetime.now());
    }
    _clearInputFields();

    Navigator.pop(context);
  }

  void _clearInputFields() {
    commentController.clear();
    _startController.clear();
    _endController.clear();
    projectValue = projectList.first;
    taskValue = taskList.first;
    tagValue = tagList.first;
    _startTime = const TimeOfDay(hour: 0, minute: 0);
    _endTime = const TimeOfDay(hour: 0, minute: 0);
    setState(() {
      _message = '';
    });
  }

  // Formatting helper
  String _formatTime(TimeOfDay time) {
    return time.format(context);
  }

  Future<void> _addEntry() async {
    // Basic input validation
    if (projectValue.isEmpty || taskValue.isEmpty) {
      setState(() {
        _message = "Please enter both project and task";
      });
      return;
    }
    else if (_startController.text.isEmpty || _endController.text.isEmpty ) {
      setState(() {
        _message = "Please enter start time and end time";
      });
      return;
    }
    else{
      // Create an entry and push it to the global list
      DateTime selectedDate = DateTime.now();
      WorkEntry newEntry = WorkEntry(
        projectValue,
        taskValue,
        tagValue,
        selectedDate, // Assuming today's date for demonstration 2024927T0000
        DateTime.parse('${selectedDate.year}${selectedDate.month < 10 ? '0' + selectedDate.month.toString() : selectedDate.month}${selectedDate.day < 10 ? '0' + selectedDate.day.toString() : selectedDate.day}T${ _startTime.hour < 10 ? '0' + _startTime.hour.toString() : _startTime.hour}${_startTime.minute < 10 ? '0'+ _startTime.minute.toString() : _startTime.minute}00'), // Assuming _startController.text is in a DateTime parseable format
        DateTime.parse('${selectedDate.year}${selectedDate.month < 10 ? '0' + selectedDate.month.toString() : selectedDate.month}${selectedDate.day < 10 ? '0' + selectedDate.day.toString() : selectedDate.day}T${ _endTime.hour < 10 ? '0' + _endTime.hour.toString() : _endTime.hour}${_endTime.minute < 10 ? '0'+ _endTime.minute.toString() : _endTime.minute}00'), // Assuming _startController.text is in a DateTime parseable format
        commentController.text,
      );
      // Use the provider to add the new entry
      Provider.of<WorkEntryProvider>(context, listen: false).addEntry(newEntry);

      // Clear the input fields after submission
      _clearInputFields();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    const String startTranslation = 'Start';
    const String stopTranslation = 'Stop';
    const String submitTranslation = 'Submit';
    const String addCommentTranslation = 'Add comment...';
    const String timerhelpTranslation = 'Timer';
    const String setHoursTranslation = 'Set hours';
    ColorProvider varit = ColorProvider();
    return(
      Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                _message,
                style: TextStyle(
                  color: varit.warning,
                )
              )
            ),
            const SizedBox(height: 24.0),
            Column(
              children: [
                Text(timerBox ? timerhelpTranslation : setHoursTranslation),
                Switch(
                  value: timerBox,
                  activeColor: varit.mainColorDark,
                  onChanged: (bool value) {
                    setState(() {
                      timerBox = value;
                    });
                  },
                ),
              ],
            ),
            DropdownMenu(
              width: MediaQuery.of(context).size.width,
              initialSelection: projectList.first,
              onSelected: (String? value) {
                setState(() {
                  projectValue = value!;
                });
              },
              dropdownMenuEntries: projectList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            DropdownMenu(
              width: MediaQuery.of(context).size.width,
              initialSelection: taskList.first,
              onSelected: (String? value) {
                setState(() {
                  taskValue = value!;
                });
              },
              dropdownMenuEntries: taskList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),const SizedBox(height: 16.0),
            DropdownMenu(
              width: MediaQuery.of(context).size.width,
              initialSelection: tagList.first,
              onSelected: (String? value) {
                setState(() {
                  tagValue = value!;
                });
              },
              dropdownMenuEntries: tagList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            if(!timerBox)
              Column(
                children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Start Time',
                            ),
                            readOnly: true,
                            controller: _startController,
                            onTap: () => _selectTime(context, true),
                          )
                        ),
                        const SizedBox(width:7.0),
                        SizedBox(child:
                          IconButton(
                            icon: const Icon(Icons.access_time),
                            onPressed: () => _selectTime(context, true),
                          )
                        ),
                      ]
                    ),
                  
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'End Time',
                          ),
                          readOnly: true,
                          controller: _endController,
                          onTap: () => _selectTime(context, false),
                        )
                      ),
                      const SizedBox(width:7.0),
                      SizedBox(child:
                        IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: () => _selectTime(context, false),
                        )
                      ),
                    ]
                  ),
                ],
              ),
            const SizedBox(height: 16.0),
            TextField(
            controller: commentController,
              decoration: InputDecoration(
                hintText: addCommentTranslation,
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: varit.textColorLGray,
                ),
              ),
            ),
            const Spacer(),
            if(timerBox)
              FullwidthBtn(
                btnCallBack: _toggleTimer,
                btnColor: widget.btnColor,
                txtColor: widget.txtColor,
                btnText: _isTimerRunning ? stopTranslation : startTranslation
              ),
            if(!timerBox)
              FullwidthBtn(
                btnCallBack: _addEntry,
                btnColor: widget.btnColor,
                txtColor: widget.txtColor,
                btnText: submitTranslation
              ),
          ],
        )
      )
    );
  }
}