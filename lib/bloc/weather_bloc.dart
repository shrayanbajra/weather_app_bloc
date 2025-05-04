import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/data/repository/weather_repository.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>(_getCurrentWeather);
  }

  void _getCurrentWeather(event, emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(errorMessage: 'Something went wrong'));
    }
  }
}
