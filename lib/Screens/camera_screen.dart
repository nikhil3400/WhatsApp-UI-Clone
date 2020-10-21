import 'package:camera/camera.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController _camController;
  int _cameraIndex = 0;

  void _initCamera(int index) async {
    if (_camController != null) {
      await _camController.dispose();
    }
    _camController = CameraController(cameras[index], ResolutionPreset.high);

    // If the controller is updated then update the UI.
    _camController.addListener(() {
      if (mounted) setState(() {});
      if (_camController.value.hasError) {
        print('Error in camera init');
      }
    });

    try {
      await _camController.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {
        _cameraIndex = index;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCamera(_cameraIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _camController?.dispose();
    super.dispose();
  }

  void _onSwitchCamera() {
    if (_camController == null ||
        !_camController.value.isInitialized ||
        _camController.value.isTakingPicture) {
      return;
    }
    final newIndex = _cameraIndex + 1 == cameras.length ? 0 : _cameraIndex + 1;
    _initCamera(newIndex);
  }

  Widget _buildCameraPreview() {
    if (!_camController.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio:
        _camController.value.aspectRatio,
        child: CameraPreview(_camController));
  }

  Widget _buildGalleryBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;

    return Container(
      height: barHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: vertPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int _){
          return Container(
            padding: EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: Image(
              image: NetworkImage('https://www.ledr.com/colours/grey.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildControllerBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.flash_auto),
          onPressed: (){}
        ),
        GestureDetector(
          onTap: (){},
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
            ),
          ),
        ),
        IconButton(                           // <-- Switch camera
          color: Colors.white,
          icon: Icon(Icons.switch_camera),
          onPressed: _onSwitchCamera,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCameraPreview(),

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildGalleryBar(),
            _buildControllerBar(),
            SizedBox(height: 8),
            Text('Tap for Photo',style: TextStyle(color: Colors.white),),
            SizedBox(height: 15),
          ],
        ),
      ],
    );
  }
}