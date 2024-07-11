class TimelineModel {
  DateTime? date;
  String? name;
  String? category;
  String? location;

  TimelineModel({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(json["date"]) * 1000),
      name: json["name"],
      category: json["category"],
      location: json["location"],
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date!.millisecondsSinceEpoch ~/ 1000,
    "name": name,
    "category": category,
    "location": location,
  };
}
