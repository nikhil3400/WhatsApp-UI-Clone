import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_models.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context,i) => Column(
          children: [
            Divider(height: 10.0),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(dummyData[i].avatarUrl),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dummyData[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dummyData[i].time,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                    dummyData[i].message,
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
              ),
            ),
          ],
        ),
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