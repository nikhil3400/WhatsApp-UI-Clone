import 'package:camera/camera.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController _camController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _camController = CameraController(cameras[0], ResolutionPreset.high);
    _camController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _camController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_camController.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio:
        _camController.value.aspectRatio,
        child: CameraPreview(_camController));
  }
}