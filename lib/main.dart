import 'dart:math';
import 'package:flutter/material.dart';

import 'dices.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            '7 Up Down',
            style: TextStyle(
              fontFamily: 'Taviraj',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int total;
  int group = 1;
  String res, resT;

  void _handleRadioValueChange(int value) {
    setState(() {
      group = value;
    });
  }

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      total = leftDiceNumber + rightDiceNumber;
    });
  }

  showResult(BuildContext context) {
    setState(() {
      if ((total == 7 && group == 2) || (total < 7 && group == 1) || (total > 7 && group == 3)){
        res = "You won the game";
        resT = "Good Job!!";
      } else {
        res = "You lost the game";
        resT = "Oops!! Try Again...";
      }
    });

    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(resT),
                content: Text(res),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {return;});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(9, 48, 40, 1),
              Color.fromRGBO(35, 122, 87, 1)
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '7 UP DOWN',
            style: TextStyle(
                fontFamily: 'Taviraj',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
          Text(
            'Select Option',
            style: TextStyle(
                fontFamily: 'Taviraj', color: Colors.white, fontSize: 28),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.grey.shade200,
                child: Container(
                  width: 100,
                  height: 120,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: group,
                          onChanged: _handleRadioValueChange,
                        ),
                        Text('2 To 6',
                            style: TextStyle(
                              fontFamily: 'Taviraj',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade200,
                child: Container(
                  width: 100,
                  height: 120,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: group,
                          onChanged: _handleRadioValueChange,
                        ),
                        Text('7',
                            style: TextStyle(
                              fontFamily: 'Taviraj',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade200,
                child: Container(
                  width: 100,
                  height: 120,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Radio(
                          value: 3,
                          groupValue: group,
                          onChanged: _handleRadioValueChange,
                        ),
                        Text('8 To 12',
                            style: TextStyle(
                              fontFamily: 'Taviraj',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Dices(leftDiceNumber, rightDiceNumber),
          ButtonTheme(
            minWidth: 200.0,
            height: 50.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              onPressed: () {
                changeDiceFace();
                showResult(context);
              },
              textColor: Colors.white,
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Roll Dice',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Taviraj',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
