class Stock {
  String name;
  double currentValue;
  double minValue;
  double maxValue;
  bool favored;

  Stock({this.name, this.currentValue, this.minValue, this.maxValue, this.favored});

  Stock.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    currentValue = json['currentValue'];
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    favored = json['favored'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['currentValue'] = this.currentValue;
    data['minValue'] = this.minValue;
    data['maxValue'] = this.maxValue;
    data['favored'] = this.favored;
    return data;
  }
}
