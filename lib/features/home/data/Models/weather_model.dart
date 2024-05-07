class WeatherModel {
  String? location, state, date, image;
  double? temp, maxTemp, minTemp;
  WeatherModel({
    required this.location,
    required this.image,
    required this.state,
    required this.temp,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
  });
  factory WeatherModel.fromJason(jsonData) {
    return WeatherModel(
      temp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      date: jsonData['location']['localtime'],
      location: jsonData['location']['name'],
      maxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
      state: jsonData['forecast']['forecastday'][0]['day']['condition']['text'],
      image: jsonData['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
