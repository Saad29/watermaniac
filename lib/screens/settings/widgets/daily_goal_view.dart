import 'package:flutter/material.dart';
import 'package:watermaniac/screens/settings/Gender.dart';

typedef void DailyGoalChangedCallback(int dailyGoal);

class DailyGoalView extends StatefulWidget {
  final int age;
  final Gender gender;
  final int dailyGoal;
  final DailyGoalChangedCallback changed;

  DailyGoalView(
      {Key key,
      @required this.age,
      @required this.gender,
      @required this.dailyGoal,
      @required this.changed});

/*
TODO: Add option for peple actively doing Sports
Sportowcy +500 ml
*/
  int suggestedAmount() {
    int myAge = age != null ? age : 80;

    if (myAge < 1)
      return 80;
    else if (myAge < 3)
      return 130;
    else if (myAge < 6)
      return 170;
    else if (myAge < 9)
      return 190;
    else if (myAge < 12) {
      int female = 210;
      int male = 240;
      if (gender == null) {
        return (female + male) ~/ 2;
      }
      return gender == Gender.male ? male : female;
    } else if (myAge < 15) {
      int female = 220;
      int male = 300;
      if (gender == null) {
        return (female + male) ~/ 2;
      }
      return gender == Gender.male ? male : female;
    } else if (myAge < 18) {
      int female = 230;
      int male = 330;
      if (gender == null) {
        return (female + male) ~/ 2;
      }
      return gender == Gender.male ? male : female;
    }

    int female = 300;
    int male = 350;
    if (gender == null) {
      return (female + male) ~/ 2;
    }

    return gender == Gender.male ? male : female;
  }

  @override
  State<StatefulWidget> createState() {
    return _DailyGoalViewState(dailyGoal != null ? dailyGoal : 0);
  }
}

class _DailyGoalViewState extends State<DailyGoalView> {
  int _value = 0;

  _DailyGoalViewState(int dailyGoal) {
    _value = dailyGoal;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'DAILY USAGE',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text(
                  '($_value)',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Slider(
              onChanged: (double value) {
                setState(() {
                  _value = value.toInt();
                });
              },
              value: _value.toDouble(),
              min: 0.0,
              max: 500.0,
              divisions: 100,
              onChangeEnd: (double value) {
                widget.changed(value.toInt());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Suggested: '),
                Text(
                  widget.suggestedAmount().toString(),
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ]));
  }
}
