class Earning {
  String? name;
  String? image;
  String? date;
  int? amount;

  Earning({this.name, this.image, this.date, this.amount});

  Earning.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    data['amount'] = this.amount;
    return data;
  }
}
