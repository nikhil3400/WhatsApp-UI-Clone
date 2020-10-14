import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/calls_screen.dart';
import 'package:whatsapp_clone/Screens/camera_screen.dart';
import 'package:whatsapp_clone/Screens/chat_screen.dart';
import 'package:whatsapp_clone/Screens/status_screen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
with SingleTickerProviderStateMixin {

  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        // actions: [
        //   IconButton(icon: Icon(Icons.search), onPressed: (){}),
        //   IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
        // ],
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
           Tab(icon: Icon(Icons.camera_alt)),
           Tab(text: 'CHATS'),
           Tab(text: 'STATUS'),
           Tab(text: 'CALLS'),

          ],
        ),
      ),

     body: new TabBarView(
       controller: _tabController,
       children: [
         CameraScreen(),
         ChatsScreen(),
         StatusScreen(),
         CallsScreen(),
       ], 
     ),

     floatingActionButton: FloatingActionButton(
       backgroundColor: Color(0xff25D366),
       child: new Icon(
         Icons.message,
         color: Colors.white,
       ),
       onPressed: (){
         print('New Chats');
       },
     ),
    );
  }
}