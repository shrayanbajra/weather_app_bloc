part of 'weather_bloc.dart';

sealed class WeatherEvent {}

class WeatherFetched extends WeatherEvent {
  String cityName;

  WeatherFetched(this.cityName);
}
