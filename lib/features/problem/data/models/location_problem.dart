class LocationProblem {
  final double lat;
  final double lon;

  LocationProblem({required this.lat, required this.lon});

  factory LocationProblem.fromJson(Map<String, dynamic> json) =>
      LocationProblem(
          lat: double.tryParse(json['Lat']) ?? 0,
          lon: double.tryParse(json['Lon']) ?? 0);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Lat'] = lat.toString();
    data['Lon'] = lon.toString();
    return data;
  }
}
