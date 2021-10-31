import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/CustomsWidgets/TimerWidget.dart';
import 'package:flutter_practice/AudioRecordExample/Painters/CirculerPainter.dart';
import 'package:flutter_practice/AudioRecordExample/Painters/CurvePainter.dart';
import 'package:flutter_practice/AudioRecordExample/Utils/SoundRecorder.dart';
import 'package:flutter_practice/Utils/Utils.dart';
import 'package:get/get.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen>
    with SingleTickerProviderStateMixin {

  final TimerController timeController = TimerController();
  final recorder = SoundRecorder();
 // double? _scale;
  //AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    recorder.init();
    /*_controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });*/
  }

  @override
  void dispose() {
    recorder.dispose();
  //  _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
      bottomNavigationBar: Container(
        height: setHeight(context, 0.15),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, -1.0),
              blurRadius: 8.0,
              spreadRadius: 5.0,
              color: Color(0xff10000000)
            )
          ],
          color: Color(0XFFe5fbff),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0))
        ),
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedButton(
                shadowDegree: ShadowDegree.dark,
                color: Colors.transparent,
                duration: 70,  		// Animaton duration, default is 70 Milliseconds
                height: setHeight(context, 0.1),  		// Button Height, default is 64
                width: setWidth(context, 0.2),  			// Button width, default is 200
                enabled: true,
                child:
                recorder.isRecording
                    ? Column(
                  children: [
                    Icon(
                        Icons.stop_circle_outlined,
                        color: Color(0xff113a83),
                        size: 42 ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stop".toUpperCase(),
                          style: TextStyle(
                            color: Color(0xff113a83),
                          ),
                        )
                      ],
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Icon(
                        Icons.mic,
                        color: Color(0xff113a83),
                        size: 42 ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start".toUpperCase(),
                          style: TextStyle(
                            color: const Color(0xff113a83),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                onPressed: () async {
                  await recorder.toggleRecording();
                  final isRecording = recorder.isRecording;
                  setState(() {});
                  if(isRecording){
                    timeController.startTimer();
                  }else{
                    timeController.stopTimer();
                  }

                })

          ],
        ),
      ),
    );
  }

  AppBar getAppbar(){
    return AppBar(
      backgroundColor: const Color(0XFFe5fbff),
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xff113a83),
        ),
        onPressed: (){
         Get.back();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Record Home",
        style: TextStyle(
          color: Color(0xff113a83),
          fontSize: 18
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.file_copy_sharp,
            color: Color(0xff113a83),
          ),
          onPressed: (){

          },
        )
      ],
    );
  }

  Widget getBody(){

    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimerWidget(controller: timeController,)
                ],
              )
            ],
          ),
        ),

        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: CurvePainter(),
          ),
        ),
      ],
    );

  }

}
