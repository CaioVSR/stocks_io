class Stock {
  String tickerSymbol;
  String name;
  double openingValue;
  double currentValue;
  double minValue;
  double maxValue;
  bool favored;

  Stock(
      {this.tickerSymbol, this.name, this.currentValue, this.minValue, this.maxValue, this.favored, this.openingValue});

  Stock.fromJson(Map<String, dynamic> json) {
    openingValue = json['openingValue'];
    tickerSymbol = json['tickSymbol'];
    name = json['name'];
    currentValue = json['currentValue'];
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    favored = json['favored'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['openingValue'] = this.openingValue;
    data['tickSymbol'] = this.tickerSymbol;
    data['name'] = this.name;
    data['currentValue'] = this.currentValue;
    data['minValue'] = this.minValue;
    data['maxValue'] = this.maxValue;
    data['favored'] = this.favored;
    return data;
  }
}
