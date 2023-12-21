import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';

class DayNightTime extends StatefulWidget {
  const DayNightTime({super.key});

  @override
  State<DayNightTime> createState() => _DayNightTimeState();
}

class _DayNightTimeState extends State<DayNightTime> {
  // create time variable
  TimeOfDay _timeOfDay = TimeOfDay.now();
  // whether to display a IOS style picker (Not exactly the same)
  bool iosStyle = true;
  // update time variable on change
  void onTimeChanged(TimeOfDay time) {
    setState(() {
      _timeOfDay = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Day Night Time"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _timeOfDay.format(context),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.black38
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        elevation: 1,
                        value: Time.fromTimeOfDay(_timeOfDay, 60),
                        onChange: onTimeChanged,
                        context: context,
                        is24HrFormat: false,
                        minuteInterval: TimePickerInterval.FIVE,
                        iosStylePicker: iosStyle // for IOS style
                      )
                    );
                  },
                  child: Text(
                    "Time Picker",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
