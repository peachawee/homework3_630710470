import 'package:flutter/material.dart';

import '../check_ans.dart';
import '../shownull.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({Key? key}) : super(key: key);

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  var _input = '';
  var _state = 'ทายเลข 1 ถึง 100';
  var _check = CheckAns();

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
         _handleClickedButton(num);
        },
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          width: 60.0,
          height: 30.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffD8BFD8),
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: num >= 0
              ? Text(
            num.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.purple,
            ),
          )
              : num == -2
              ? Icon(
            Icons.clear,
            color: Colors.purple,
          )
              : Icon(
            Icons.backspace_outlined,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  void _handleClickedButton(int num) {
    if (num == -2) {
      setState(() {
        _input = '';
      });
    } else if (num == -1) {
      if (_input.length > 0) {
        setState(() {
          _input = _input.substring(0, _input.length - 1);
        });
      }
    } else if (num == -3) {
      if (_input.length > 0) {
        setState(() {
          _state = _check.doGuess(int.parse(_input))!;
          if (!_check.isCorrect) _input = '';
        });
      } else {
        showNull(context);
      }
    } else {
      if (_input.length < 3) {
        setState(() {
          _input = _input + num.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUESS THE NUMBER')),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 110.0,
                      ),
                      Image.asset('assets/images/guess_logo.png', width: 100.0),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 110.0,
                        ),
                        Text(
                          'GUESS',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xffDDA0DD),
                          ),
                        ),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90.0,
              ),
              Text(
                _input,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                _state,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNumberButton(1),
                          _buildNumberButton(2),
                          _buildNumberButton(3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNumberButton(4),
                          _buildNumberButton(5),
                          _buildNumberButton(6),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNumberButton(7),
                          _buildNumberButton(8),
                          _buildNumberButton(9),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNumberButton(-2),
                          _buildNumberButton(0),
                          _buildNumberButton(-1),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () => _handleClickedButton(-3),
                              child: Text(
                                'GUESS',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
