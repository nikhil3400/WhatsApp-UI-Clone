class CallModel{
  final String name;
  final String dateAndTime;
  final String avatarUrl;
  

  CallModel({this.name,this.dateAndTime,this.avatarUrl});
}

List<CallModel> callData = [
  new CallModel(
    name: "Nikhil",
    dateAndTime: "October 12, 4:18 PM",
    avatarUrl: "https://image.flaticon.com/icons/png/512/17/17004.png",
  ),
  new CallModel(
    name: "Aakash",
    dateAndTime: "October 10, 7:08 PM",
    avatarUrl: "https://image.flaticon.com/icons/png/512/17/17004.png",
  ),
  new CallModel(
    name: "Keshav",
    dateAndTime: "October 1, 6:07 PM",
    avatarUrl: "https://image.flaticon.com/icons/png/512/17/17004.png",
  ),
  new CallModel(
    name: "Aryan",
    dateAndTime: "October 12, 7:18 PM",
    avatarUrl: "https://image.flaticon.com/icons/png/512/17/17004.png",
  ),
];