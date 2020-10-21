import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/home.dart';


List<CameraDescription> cameras;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
  cameras = await availableCameras();
  } on CameraException catch(e){
    print(e);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}