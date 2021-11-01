
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';


class SoundRecorder {

  FlutterSoundRecorder? _recorder;
  bool _isRecorderInitialized = false;

  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;

  bool get isRecording => _recorder!.isRecording;
  bool get icMediaPlayerIsPlaying => _mPlayer!.isPlaying;

  Future init() async {
    _recorder = FlutterSoundRecorder();

    var status = await Permission.microphone.request();

    if(status != PermissionStatus.granted){
      throw RecordingPermissionException("Microphone permission has Denied");
    }

    await _recorder!.openAudioSession(
      device: AudioDevice.blueToothA2DP,
      audioFlags: allowHeadset | allowEarPiece | allowBlueToothA2DP,
      category: SessionCategory.playAndRecord,
    );
    _isRecorderInitialized = true;

    // Be careful : openAudioSession returns a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    await _mPlayer!.openAudioSession(
      device: AudioDevice.blueToothA2DP,
      audioFlags: allowHeadset | allowEarPiece | allowBlueToothA2DP,
      category: SessionCategory.playAndRecord,
    );
    _mPlayerIsInited = true;
  }

  Future dispose() async {
    await _recorder!.closeAudioSession();
    _recorder = null;
    _isRecorderInitialized = false;

    _mPlayer!.closeAudioSession();
    _mPlayer = null;
  }

  Future _recordStart() async {

    if(!_isRecorderInitialized)
      return;

    await _recorder!.startRecorder(toFile: "Record1.aac");
  }

  Future _recordStop() async {

    if(!_isRecorderInitialized)
      return;

    await _recorder!.stopRecorder();
  }

  Future toggleRecording() async {

    if(!_isRecorderInitialized)
      return;

    if(_recorder!.isStopped){
      await _recordStart();
    }else{
      await _recordStop();
    }
  }

  void play() async {
    await _mPlayer!.startPlayerFromMic();
  }

  Future<void> stopPlayer() async {
    if (_mPlayer != null) {
      await _mPlayer!.stopPlayer();
    }
  }

  Future<Uint8List> _getAssetData(String path) async {
    var asset = await rootBundle.load(path);
    return asset.buffer.asUint8List();
  }

}