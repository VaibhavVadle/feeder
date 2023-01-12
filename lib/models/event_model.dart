import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? title;
  String? description;
  int? guestNum;
  int? price;
  Timestamp? eventDate;
  Timestamp? startTime;
  Timestamp? endTime;
  String? landmark;
  String? state;
  List<dynamic>? eventImage;


  EventModel(
      {this.title,
        this.description,
        this.guestNum,
        this.price,
        this.eventDate,
        this.startTime,
        this.endTime,
        this.landmark,
        this.state,
      this.eventImage});
  //can use fromMap instead of fromJson
  EventModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    guestNum = json['guestNum'];
    price = json['price'];
    eventDate = json['eventDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    landmark = json['landmark'];
    state = json['state'];
    eventImage = json['eventImage'];
  }
  //can use toMap instead of toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['guestNum'] = this.guestNum;
    data['price'] = this.price;
    data['eventDate'] = this.eventDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['landmark'] = this.landmark;
    data['state'] = this.state;
    data['eventImage'] = this.eventImage;
    return data;
  }
}
