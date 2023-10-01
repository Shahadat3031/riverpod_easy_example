Future<String> fetchWeatherReport() async {
  return await Future.delayed(Duration(seconds: 2), () => "Sunny");
}