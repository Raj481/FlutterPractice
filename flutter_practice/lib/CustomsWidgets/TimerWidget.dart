import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/AudioRecordExample/Painters/CirculerPainter.dart';


class TimerController extends ValueNotifier<bool> {
  TimerController({bool isPlaying = false}) : super(isPlaying);

  void startTimer() => value = true;

  void stopTimer() => value = false;

}


class TimerWidget extends StatefulWidget {
  final TimerController controller;
  const TimerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  Duration duration = Duration();
  Timer? timer;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if(widget.controller.value){
        startTimer();
      }else{
        stopTimer();
      }
    });
  }

  void reset() => setState(() {
    duration = Duration();
  });

  void addTime(){

    final addSeconds = 1;

    setState(() {
      final second = duration.inSeconds + addSeconds;

      if(second<0){
        timer!.cancel();
      }else{
        duration = Duration(seconds: second);
      }

    });
  }

  void startTimer({bool resets = true}){
    if(!mounted) return;
    if(resets){
      reset();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}){
    if(!mounted) return;
    if(resets){
      reset();
    }
    setState(() {
      timer!.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      painter: CirculerPainter(),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                    Icons.mic,
                    color: Color(0xff113a83),
                    size: 42 ),
              ],
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${format(duration)}",
                  style: TextStyle(
                    color: Color(0xff113a83),
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                    shadows: [
                      BoxShadow(
                        color: Color(0xff20113a83),
                        offset: Offset(0.0,3.0)
                      ),
                    ]
                  ),
                )
              ],

            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Press Start",
                  style: TextStyle(
                    color: Color(0xff113a83),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}
