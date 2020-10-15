class CallModel{
  final String name;
  final String dateAndTime;
  final String avatarUrl;
  final String call;

  CallModel({this.name,this.dateAndTime,this.call,this.avatarUrl});
}

List<CallModel> callData = [
  new CallModel(
    name: "Nikhil",
    dateAndTime: "October 12, 4:18 PM",
    call: "Icons.video_call",
    avatarUrl: "https://image.flaticon.com/icons/png/512/17/17004.png",
  ),
];