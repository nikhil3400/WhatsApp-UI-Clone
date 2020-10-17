import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/calls_model.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callData.length,
      itemBuilder: (context,i) => Column(
        children: [
          Divider(height:10.0),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(callData[i].avatarUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  callData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                  callData[i].dateAndTime,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
            ),
            trailing: Icon(
              Icons.video_call_rounded,
              color: Color(0xff075E54),
              ),
          )
        ],
      ),
    );
  }
}